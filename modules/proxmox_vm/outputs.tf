output "vm_info" {
  value = {
    id          = proxmox_virtual_environment_vm.this.id
    name        = proxmox_virtual_environment_vm.this.name
    node_name   = proxmox_virtual_environment_vm.this.node_name
    clone_vm_id = proxmox_virtual_environment_vm.this.clone[0].vm_id
    agent       = proxmox_virtual_environment_vm.this.agent[0].enabled
    memory      = proxmox_virtual_environment_vm.this.memory[0].dedicated
    dns_servers  = proxmox_virtual_environment_vm.this.initialization[0].dns[0].servers
    ipv4_address = proxmox_virtual_environment_vm.this.initialization[0].ip_config[0].ipv4[0].address
  }

}
