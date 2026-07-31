### Step 1: Deploy kube-state-metrics as a NodePort

```bash
kubectl apply -f kube-state-metrics-exposed.yaml
```

### Step 2. Configure HAProxy

```yaml
# Listen for Prometheus scraping requests on the VIP network
frontend k8s_metrics_front
    bind *:32080
    mode tcp
    option tcplog
    default_backend k8s_metrics_back

# Forward requests to the Kubernetes NodePort
backend k8s_metrics_back
    mode tcp
    balance roundrobin
    # Health check the port to ensure the node network is responsive
    option tcp-check 
    server k8s-node-1 10.10.30.48:32080 check
    server k8s-node-2 10.10.30.49:32080 check
    server k8s-node-3 10.10.30.50:32080 check
``` 

### 3. Prometheus Cfg

```yaml
  # ---- Kubernetes Cluster-Specific Metrics via HAProxy VIP
  - job_name: 'kubernetes-cluster-state'
    metrics_path: /metrics
    static_configs:
      - targets:
        - '10.10.30.100:32080' # <--- Replace with your Keepalived VIP
```

### 4. Grafana 

Grafana Dashboard ID: 13332 (Kubernetes Deployment/Pod/State Metrics)
