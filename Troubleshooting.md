### Basic commands for trouble-shooting

#### 1. PostgeSQL/Patroni


```bash
sudo patronictl -c /etc/patroni/config.yml list  #check cluster status 
```

```bash
sudo patronictl -c /etc/patroni/config.yml reinit patroni_cluster psql-node-3 # reinit node to sync replication
```

```bash
#create a backup
sudo pg_basebackup -h localhost -p 5432 -U replicator -D /var/lib/postgresql/backups -Fp -Xs -P -v

```

#### 2. CEPH

```bash
# Get current CEPH state
sudo ceph -s
```

```bash
sudo ceph orch ps #see all running daemons 
sudo ceph orch ls
```

```bash
sudo ceph orch daemon redeploy osd.1 # Redeploy OSD
```

```bash
sudo ceph orch restart alertmanager # restart service

```

```bash
sudo ceph orch daemon restart mds.lab_fs.ceph-node-1.xncvwj # restat daemon
```

#### 3. Kuberenetes

```bash

kubectl get pods -A  # get all pods in all namespaces
kubectl get nodes    # get all nodes

kubectl get ns       # get list of namespaces
```

```bash
kubectl get svc -n ingress-nginx ingress-nginx-controller  # ingess controller status
```

```bash
kubectl scale deployment qp -n qp8 --replicas=1  # scale number oreplicas

```

```bash
kubectl logs qp-76cc4dcfd8-s28bn -n qp8 # get container`s logs

```