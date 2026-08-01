	
### 1. Install Rook

```bash
$ git clone --single-branch --branch v1.20.2 https://github.com/rook/rook.git
cd rook/deploy/examples

kubectl create -f crds.yaml -f common.yaml -f csi-operator.yaml
kubectl create -f operator.yaml
```
### 2. Verify the rook-ceph-operator is in the `Running` state before proceeding
```bash
kubectl -n rook-ceph get pod
```
### 3. Obtain CEPH cluster`data:`

 ```bash
   deploy@ceph-node-1:~$ sudo ceph mon dump
    epoch 3
    fsid 81333141-7af9-11f1-905e-bc2411209701
    last_changed 2026-07-08T18:33:14.223735+0000
    created 2026-07-08T18:20:00.635600+0000
    min_mon_release 20 (tentacle)
    election_strategy: 1
    0: [v2:10.10.80.91:3300/0,v1:10.10.80.91:6789/0] mon.ceph-node-1
    1: [v2:10.10.80.93:3300/0,v1:10.10.80.93:6789/0] mon.ceph-node-3
    2: [v2:10.10.80.92:3300/0,v1:10.10.80.92:6789/0] mon.ceph-node-2
    dumped monmap epoch 3
   #
   deploy@ceph-node-1:~$ sudo ceph auth get-key client.admin
     AQD********************************== 
```
  ### 4. Make auth key encoded by base64
  ```bash
    deploy@kub-master-1:~/Rook$ echo -n AQD*******************************== | base64
     QV*******************************==
  ```


### 4. Apply manifests

```bash
kubectl apply -f  csi-configmap.yaml
kubectl apply -f manual-csi-secrets.yaml
kubectl apply -f storageclass-cephfs.yaml
```

### 5 Restart Rook

```bash
# Restart the main Rook operator deployment
kubectl rollout restart deployment rook-ceph-operator -n rook-ceph

# Restart the CephFS CSI provisioner daemons
kubectl rollout restart deployment rook-csi-cephfs-provisioner -n rook-ceph

# Verify all driver pods scale back up to a running state
kubectl get pods -n rook-ceph -w
```


