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
    "router-edge-1" = { 
        vm_id       =  201
        name        =  "router-edge-1"
        clone       =  "Ubuntu2404-12GB"
        memory      =  2048
        cores       =  2
        sockets     =  2
        vm_state    =  "running" 
        bridge0     =  "vmbr0"
        ip_conf0    =  "ip=192.168.70.100/24,gw=192.168.70.1"
        bridge1     =  "vmbr3"
        ip_conf1    =  "ip=10.10.30.2/24"
        start_at_node_boot =  true
      }  
   }         
}


