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
    bridge2     =  string
    bridge3     =  string
    bridge4     =  string
    bridge5     =  string
    bridge6     =  string
    bridge7     =  string
    ip_conf0    =  string
    ip_conf1    =  string
    ip_conf2    =  string
    ip_conf3    =  string
    ip_conf4    =  string
    ip_conf5    =  string
    ip_conf6    =  string
    ip_conf7    =  string
    start_at_node_boot =  bool
    
  }))

  default = {
    "router-internal-1" = { 
        vm_id       =  202
        name        =  "router-internal-1"
        clone       =  "Ubuntu2404-12GB"
        memory      =  2048
        cores       =  2
        sockets     =  2
        vm_state    =  "running" 
        bridge0     =  "vmbr0"
        ip_conf0    =  "ip=192.168.70.101/24,gw=192.168.70.1"
        bridge1     =  "vmbr3"
        ip_conf1    =  "ip=10.10.30.1/24"
        bridge2     =  "vmbr4"
        ip_conf2    =  "ip=10.10.40.1/24"
        bridge3     =  "vmbr5"
        ip_conf3    =  "ip=10.10.50.1/24"
        bridge4     =  "vmbr6"
        ip_conf4    =  "ip=10.10.60.1/24"
        bridge5     =  "vmbr7"
        ip_conf5    =  "ip=10.10.70.1/24"
        bridge6     =  "vmbr8"
        ip_conf6    =  "ip=10.10.80.1/24"
        bridge7     =  "vmbr9"
        ip_conf7    =  "ip=10.10.90.1/24"
        start_at_node_boot =  true
      }  
   }         
}


