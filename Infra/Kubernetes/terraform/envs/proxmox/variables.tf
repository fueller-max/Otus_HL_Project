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
    vm_state    =  string 
    bridge0     =  string
    bridge1     =  string
    ip_conf0    =  string
    ip_conf1    =  string
    sys_disk    = string
    start_at_node_boot =  bool
  }))

  default = {
    "kub-master-1" = { 
        vm_id       =  151
        name        =  "kub-master-1"
        clone       =  "Ubuntu2404-20GB"
        memory      =  4096
        cores       =  2
        sockets     =  2
        vm_state    =  "running" 
        bridge0     =  "vmbr0"
        ip_conf0    =  "ip=192.168.70.48/24,gw=192.168.70.1"
        bridge1     =  "vmbr3"
        ip_conf1    =  "ip=10.10.30.48/24"
        start_at_node_boot =  true
        sys_disk    =  "20G"
      }
    "kub-master-2" = { 
        vm_id       =  152
        name        =  "kub-master-2"
        clone       =  "Ubuntu2404-20GB"
        memory      =  4096
        cores       =  2
        sockets     =  2
        vm_state    =  "running" 
        bridge0     =  "vmbr0"
        ip_conf0    =  "ip=192.168.70.49/24,gw=192.168.70.1"
        bridge1     =  "vmbr3"
        ip_conf1    =  "ip=10.10.30.49/24"
        start_at_node_boot =  true
        sys_disk    =  "20G"
      }
    "kub-master-3" = { 
        vm_id       =  153
        name        =  "kub-master-3"
        clone       =  "Ubuntu2404-20GB"
        memory      =  4096
        cores       =  2
        sockets     =  2
        vm_state    =  "running" 
        bridge0     =  "vmbr0"
        ip_conf0    =  "ip=192.168.70.50/24,gw=192.168.70.1"
        bridge1     =  "vmbr3"
        ip_conf1    =  "ip=10.10.30.50/24"
        start_at_node_boot =  true
        sys_disk    =  "20G"
      }
    "kub-lb-1" = { 
        vm_id       =  154
        name        =  "kub-lb-1"
        clone       =  "Ubuntu2404-12GB"
        memory      =  2048
        cores       =  2
        sockets     =  2
        vm_state    =  "running" 
        bridge0     =  "vmbr0"
        ip_conf0    =  "ip=192.168.70.51/24,gw=192.168.70.1"
        bridge1     =  "vmbr3"
        ip_conf1    =  "ip=10.10.30.51/24"
        start_at_node_boot =  true
        sys_disk    =  "12G"
      } 
    "kub-lb-2" = { 
        vm_id       =  155
        name        =  "kub-lb-2"
        clone       =  "Ubuntu2404-12GB"
        memory      =  2048
        cores       =  2
        sockets     =  2
        vm_state    =  "running" 
        bridge0     =  "vmbr0"
        ip_conf0    =  "ip=192.168.70.52/24,gw=192.168.70.1"
        bridge1     =  "vmbr3"
        ip_conf1    =  "ip=10.10.30.52/24"
        start_at_node_boot =  true
        sys_disk    =  "12G"
      }
    "kub-worker-1" = { 
        vm_id       =  156
        name        =  "kub-worker-1"
        clone       =  "Ubuntu2404-20GB"
        memory      =  4096
        cores       =  2
        sockets     =  2
        vm_state    =  "running" 
        bridge0     =  "vmbr0"
        ip_conf0    =  "ip=192.168.70.53/24,gw=192.168.70.1"
        bridge1     =  "vmbr3"
        ip_conf1    =  "ip=10.10.30.53/24"
        start_at_node_boot =  true
        sys_disk    =  "20G"
      }  
    "kub-worker-2" = { 
        vm_id       =  157
        name        =  "kub-worker-2"
        clone       =  "Ubuntu2404-20GB"
        memory      =  4096
        cores       =  2
        sockets     =  2
        vm_state    =  "running" 
        bridge0     =  "vmbr0"
        ip_conf0    =  "ip=192.168.70.54/24,gw=192.168.70.1"
        bridge1     =  "vmbr3"
        ip_conf1    =  "ip=10.10.30.54/24"
        start_at_node_boot =  true
        sys_disk    =  "20G"
      }  
  }   
}


