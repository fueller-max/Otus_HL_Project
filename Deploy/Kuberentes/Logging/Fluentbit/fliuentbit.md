### Deploy fluentbit connected to HA-ES cluster


Use the Kubernetes Service + Endpoints approachy. It delegates the fault tolerance and load balancing layer to Kubernetes itself, bypassing Fluent Bit’s single-host limitation.

* **Endpoint Synchronization**: Ensure that the metadata.name of your Service exactly matches the metadata.name of your Endpoints object (elasticsearch-external). This is how Kubernetes maps the routing table together.

* **Keepalive Failover**: Since Fluent Bit can now only see one DNS hostname (elasticsearch-external), make sure you keep the net.keepalive_timeout 60 parameter in your updated Fluent Bit [OUTPUT] block. Without it, Fluent Bit will open a persistent TCP connection to the first VM it resolves and won't distribute logs across the other two VMs unless that specific VM goes completely dow

* **Network Policies**: If you use restrictive Kubernetes network policies within the kube-system namespace, ensure egress traffic is permitted toward your external VM subnet (10.10.60.0/24) on port 9200.


In Kubernetes, when you manually create a Service without a selector, it looks for an Endpoints object in the same Namespace with the exact same metadata.name.Your Service is named elasticsearch-external.Your Endpoints object is named elasticsearch-external.Because the names match perfectly, the Service automatically adopts this Endpoints list as its backend target destinations.

1. **DNS Resolution**: CoreDNS resolves the hostname elasticsearch-external to the Service's internal cluster virtual IP (ClusterIP).
2. **Kube-Proxy Routing**: The kube-proxy daemon running on each Kubernetes node constantly watches the API server for changes to Service and Endpoints objects. It translates your manifests into local routing rules (using IPVS or iptables).
3. **Load Balancing**: When traffic hits the Service ClusterIP, the local iptables/IPVS rules intercept it and randomly choose one of the IPs listed in your Endpoints subset (10.10.60.61, 10.10.60.62, or 10.10.60.63).
4. **Direct Delivery**: The network packet's destination IP is rewritten (DNAT) to the chosen Elasticsearch host IP, and the packet is routed out of the Kubernetes cluster to your external network.


![](/Deploy/Kuberentes/Logging/Fluentbit/pics/Normal%20Service%20vs%20headless%20service.png)