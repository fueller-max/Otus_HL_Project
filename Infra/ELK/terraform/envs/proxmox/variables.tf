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
    "es-node-1" = { 
        vm_id       =  181
        name        =  "es-node-1"
        clone       =  "Ubuntu2404-20GB"
        memory      =  3072
        cores       =  2
        sockets     =  2
        vm_state    =  "running" 
        bridge0     =  "vmbr0"
        ip_conf0    =  "ip=192.168.70.61/24,gw=192.168.70.1"
        bridge1     =  "vmbr6"
        ip_conf1    =  "ip=10.10.60.61/24"
        start_at_node_boot =  true
        sys_disk    =  "20G"
      }
    "es-node-2" = { 
        vm_id       =  182
        name        =  "es-node-2"
        clone       =  "Ubuntu2404-20GB"
        memory      =  3072
        cores       =  2
        sockets     =  2
        vm_state    =  "running" 
        bridge0     =  "vmbr0"
        ip_conf0    =  "ip=192.168.70.62/24,gw=192.168.70.1"
        bridge1     =  "vmbr6"
        ip_conf1    =  "ip=10.10.60.62/24"
        start_at_node_boot =  true
        sys_disk    =  "20G"
      }  
    "es-node-3" = { 
        vm_id       =  183
        name        =  "es-node-3"
        clone       =  "Ubuntu2404-20GB"
        memory      =  3072
        cores       =  2
        sockets     =  2
        vm_state    =  "running" 
        bridge0     =  "vmbr0"
        ip_conf0    =  "ip=192.168.70.63/24,gw=192.168.70.1"
        bridge1     =  "vmbr6"
        ip_conf1    =  "ip=10.10.60.63/24"
        start_at_node_boot =  true
        sys_disk    =  "20G"
      }  
    "kib-node-1" = { 
        vm_id       =  186
        name        =  "kib-node-1"
        clone       =  "Ubuntu2404-20GB"
        memory      =  3072
        cores       =  2
        sockets     =  2
        vm_state    =  "running" 
        bridge0     =  "vmbr0"
        ip_conf0    =  "ip=192.168.70.66/24,gw=192.168.70.1"
        bridge1     =  "vmbr6"
        ip_conf1    =  "ip=10.10.60.66/24"
        start_at_node_boot =  true
        sys_disk    =  "20G"
      }      
  }   
}


