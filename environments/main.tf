locals {
  ubuntu_vms = {
    "vm1" = {
      name             = "k3s-master"
      node_name        = "pve"
      clone_vm_id      = 108
      agent_enabled    = false
      memory_dedicated = 768
      ipv4_address     = "dhcp"
    },
    "vm2" = {
      name             = "k3s-worker-0"
      node_name        = "pve"
      clone_vm_id      = 108
      agent_enabled    = false
      memory_dedicated = 1024
      ipv4_address     = "dhcp"
    },
    "vm3" = {
      name             = "k3s-worker-1"
      node_name        = "pve"
      clone_vm_id      = 108
      agent_enabled    = false
      memory_dedicated = 1024
      ipv4_address     = "dhcp"
    },
    "vm4" = {
      name             = "k3s-worker-2"
      node_name        = "pve"
      clone_vm_id      = 108
      agent_enabled    = false
      memory_dedicated = 1024
      ipv4_address     = "dhcp"
    }
  }
}


module "k3s_vms" {
  source   = "../modules/proxmox_vm"
  for_each = local.ubuntu_vms
  name             = each.value.name
  node_name        = each.value.node_name
  clone_vm_id      = each.value.clone_vm_id
  agent_enabled    = each.value.agent_enabled
  memory_dedicated = each.value.memory_dedicated
  ipv4_address     = each.value.ipv4_address
}

