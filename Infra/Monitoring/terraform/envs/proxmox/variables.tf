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
    start_at_node_boot =  bool
    
  }))

  default = {
    "monitoring-1" = { 
        vm_id       =  191
        name        =  "monitoring-1"
        clone       =  "Ubuntu2404-20GB"
        memory      =  3072
        cores       =  2
        sockets     =  2
        vm_state    =  "running" 
        bridge0     =  "vmbr0"
        ip_conf0    =  "ip=192.168.70.80/24,gw=192.168.70.1"
        bridge1     =  "vmbr7"
        ip_conf1    =  "ip=10.10.70.80/24"
        start_at_node_boot =  true
      }  
   }         
}


