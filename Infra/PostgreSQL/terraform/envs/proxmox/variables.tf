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
    "psql-node-1" = { 
        vm_id       =  161
        name        =  "psql-node-1"
        clone       =  "Ubuntu2404-12GB"
        memory      =  2048
        cores       =  2
        sockets     =  2
        vm_state    =  "running" 
        bridge0     =  "vmbr0"
        ip_conf0    =  "ip=192.168.70.71/24,gw=192.168.70.1"
        bridge1     =  "vmbr4"
        ip_conf1    =  "ip=10.10.40.71/24"
        start_at_node_boot =  true
        sys_disk    =  "12G"
      }
    "psql-node-2" = { 
        vm_id       =  162
        name        =  "psql-node-2"
        clone       =  "Ubuntu2404-12GB"
        memory      =  2048
        cores       =  2
        sockets     =  2
        vm_state    =  "running" 
        bridge0     =  "vmbr0"
        ip_conf0    =  "ip=192.168.70.72/24,gw=192.168.70.1"
        bridge1     =  "vmbr4"
        ip_conf1    =  "ip=10.10.40.72/24"
        start_at_node_boot =  true
        sys_disk    =  "12G"
      }  
     "psql-node-3" = { 
        vm_id       =  163
        name        =  "psql-node-3"
        clone       =  "Ubuntu2404-12GB"
        memory      =  2048
        cores       =  2
        sockets     =  2
        vm_state    =  "running" 
        bridge0     =  "vmbr0"
        ip_conf0    =  "ip=192.168.70.73/24,gw=192.168.70.1"
        bridge1     =  "vmbr4"
        ip_conf1    =  "ip=10.10.40.73/24"
        start_at_node_boot =  true
        sys_disk    =  "12G"
      }
     "psql-ha-1" = { 
        vm_id       =  164
        name        =  "psql-ha-1"
        clone       =  "Ubuntu2404-12GB"
        memory      =  2048
        cores       =  2
        sockets     =  2
        vm_state    =  "running" 
        bridge0     =  "vmbr0"
        ip_conf0    =  "ip=192.168.70.74/24,gw=192.168.70.1"
        bridge1     =  "vmbr4"
        ip_conf1    =  "ip=10.10.40.74/24"
        start_at_node_boot =  true
        sys_disk    =  "12G"
      } 
     "psql-ha-2" = { 
        vm_id       =  165
        name        =  "psql-ha-2"
        clone       =  "Ubuntu2404-12GB"
        memory      =  2048
        cores       =  2
        sockets     =  2
        vm_state    =  "running" 
        bridge0     =  "vmbr0"
        ip_conf0    =  "ip=192.168.70.75/24,gw=192.168.70.1"
        bridge1     =  "vmbr4"
        ip_conf1    =  "ip=10.10.40.75/24"
        start_at_node_boot =  true
        sys_disk    =  "12G"
      }       
  }   
}


