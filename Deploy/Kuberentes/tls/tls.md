## Self-signed cert

### 1. Install cert-manager

```bash
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.21.0/cert-manager.yaml

kubectl get pods -n cert-manager
NAME                                       READY   STATUS    RESTARTS   AGE
cert-manager-57bdfd98ff-f6dmq              1/1     Running   0          107s
cert-manager-cainjector-59748ccbbf-s5xp4   1/1     Running   0          109s
cert-manager-webhook-f7fb48c4d-brc42       1/1     Running   0          106s
```

### 2. Create a ClusterIssuer

```yaml
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: selfsigned-issuer
spec:
  selfSigned: {}
```

```bash
kubectl apply -f  cluster-issuer.yaml
```

### 3. Update your Ingress to enforce HTTPS 

```yaml
annotations:
    kubernetes.io/ingress.class: "nginx"
    cert-manager.io/cluster-issuer: "selfsigned-issuer" # <-- Automates SSL creation
    nginx.ingress.kubernetes.io/ssl-redirect: "true"    # <-- Forces http to https redirec
```

## Local Certificate Authority (CA)

### 1. Create a Local Root CA inside Kubernetes

```yaml
apiVersion: cert-manager.io/v1
kind: Issuer
metadata:
  name: selfsigned-root-issuer
  namespace: qp8
spec:
  selfSigned: {}
---
apiVersion: cert-manager.io/v1
kind: Certificate
metadata:
  name: local-root-ca-cert
  namespace: qp8
spec:
  isCA: true
  commonName: QP8 Local Lab Root CA
  secretName: local-root-ca-secret
  privateKey:
    algorithm: ECDSA
    size: 256
  issuerRef:
    name: selfsigned-root-issuer
    kind: Issuer
    group: cert-manager.io
---
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: trusted-lab-issuer
spec:
  ca:
    secretName: local-root-ca-secret
```

```bash
kubectl apply -f  local-ca-setup.yaml

issuer.cert-manager.io/selfsigned-root-issuer created
certificate.cert-manager.io/local-root-ca-cert created
clusterissuer.cert-manager.io/trusted-lab-issuer created

```

### 3. Update Your Ingress to Use the Trusted CA

```bash
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: qp-storage
  namespace: qp8
  annotations:
    cert-manager.io/cluster-issuer: "trusted-lab-issuer"
    nginx.ingress.kubernetes.io/ssl-redirect: "true"
spec:
  ingressClassName: nginx # <-- Modern alternative to ingress.class
  tls:
  - hosts:
    - qp-storage.test
    secretName: qp-storage-tls-cert # <-- Cert-manager will auto-create this
  rules:
  - host: qp-storage.test
    http:
      paths:
      - backend:
          service:
            name: qp-storage
            port:
              number: 80
        path: /
        pathType: Prefix
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: qp
  namespace: qp8
  annotations:
    cert-manager.io/cluster-issuer: "trusted-lab-issuer"
    nginx.ingress.kubernetes.io/ssl-redirect: "true"
spec:
  ingressClassName: nginx # <-- Modern alternative to ingress.class
  tls:
  - hosts:
    - qp.test
    secretName: qp-tls-cert # <-- Cert-manager will auto-create this
  rules:
  - host: qp.test
    http:
      paths:
      - backend:
          service:
            name: qp
            port:
              number: 80
        path: /
        pathType: Prefix

```

### 3. Export and Trust the Root CA on your Personal Computer

```bash
kubectl get secret local-root-ca-secret -n qp8 -o jsonpath='{.data.tls\.crt}' | base64 -d > lab-root-ca.crt
```

**Install** it onto your operating system:
* Windows: Double-click lab-root-ca.crt -> Click Install Certificate -> Choose Local Machine -> Choose Place all certificates in the following store -> Select Trusted Root Certification Authorities -> Click Finish.

* Linux (Ubuntu/Debian Workstation): Copy the file to /usr/local/share/ca-certificates/lab-root-ca.crt and execute sudo update-ca-certificates.