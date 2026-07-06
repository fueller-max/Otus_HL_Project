variable "proxmox_api_url" {
  type        = string
}

variable "proxmox_api_token_id" {
  type        = string
}

variable "proxmox_api_token_secret" {
  type        = string
}

variable vm_configs{

  type = map(object({
    vm_id       =  number
    name        =  string
    clone       =  string
    memory      =  number
    cores       =  number
    sockets     =  number
    osd_size    =  string
    vm_state    =  string 
    bridge0     =  string
    bridge1     =  string
    bridge2     =  string
    ip_conf0    =  string
    ip_conf1    =  string
    ip_conf2    =  string
    start_at_node_boot =  bool
    
  }))

  default = {
    "ceph-node-1" = { 
        vm_id       =  171
        name        =  "ceph-node-1"
        clone       =  "Ubuntu2404-20GB"
        memory      =  6144
        cores       =  2
        sockets     =  2
        vm_state    =  "running" 
        bridge0     =  "vmbr0"
        ip_conf0    =  "ip=192.168.70.91/24,gw=192.168.70.1"
        bridge1     =  "vmbr8"
        ip_conf1    =  "ip=10.10.80.91/24"
        bridge2     =  "vmbr9"
        ip_conf2    =  "ip=10.10.90.91/24"
        start_at_node_boot =  true
        osd_size   = "10G"
      }
    "ceph-node-2" = { 
        vm_id       =  172
        name        =  "ceph-node-2"
        clone       =  "Ubuntu2404-20GB"
        memory      =  6144
        cores       =  2
        sockets     =  2
        vm_state    =  "running" 
        bridge0     =  "vmbr0"
        ip_conf0    =  "ip=192.168.70.92/24,gw=192.168.70.1"
        bridge1     =  "vmbr8"
        ip_conf1    =  "ip=10.10.80.92/24"
        bridge2     =  "vmbr9"
        ip_conf2    =  "ip=10.10.90.92/24"
        start_at_node_boot =  true
        osd_size    = "10G"
      }  
    "ceph-node-3" = { 
        vm_id       =  173
        name        =  "ceph-node-3"
        clone       =  "Ubuntu2404-20GB"
        memory      =  6144
        cores       =  2
        sockets     =  2
        vm_state    =  "running" 
        bridge0     =  "vmbr0"
        ip_conf0    =  "ip=192.168.70.93/24,gw=192.168.70.1"
        bridge1     =  "vmbr8"
        ip_conf1    =  "ip=10.10.80.93/24"
        bridge2     =  "vmbr9"
        ip_conf2    =  "ip=10.10.90.93/24"
        start_at_node_boot =  true
        osd_size    = "10G"
      }   
   }         
}


