locals {
  ubuntu_vms = {
    "vm1" = {
      name             = "k3s-controller-0"
      node_name        = "pve"
      clone_vm_id      = 108
      agent_enabled    = true
      memory_dedicated = 4096
      ipv4_address     = "192.168.254.29/32"
    },
    "vm2" = {
      name             = "k3s-worker-0"
      node_name        = "pve"
      clone_vm_id      = 108
      agent_enabled    = true
      memory_dedicated = 2048
      ipv4_address     = "192.168.254.30/32"
    },
    "vm3" = {
      name             = "k3s-worker-1"
      node_name        = "pve"
      clone_vm_id      = 108
      agent_enabled    = true
      memory_dedicated = 2048
      ipv4_address     = "192.168.254.31/32"
    },
    "vm4" = {
      name             = "k3s-worker-2"
      node_name        = "pve"
      clone_vm_id      = 108
      agent_enabled    = true
      memory_dedicated = 2048
      ipv4_address     = "192.168.254.32/32"
    }
  }
}




# module "k3s_vms" {
#   source = "../modules/proxmox_vm"
#   for_each = local.ubuntu_vms
#   vm_name             = each.value.name
#   hostname            = each.value.name
#   node_name           = each.value.node_name
#   vm_id               = 1001 + index(keys(local.ubuntu_vms), each.key) # or however you want to assign VM IDs
#   memory_mb           = each.value.memory_dedicated
#   disk_datastore_id    = "local-lvm"
#   iso_datastore_id     = "local"
#   iso_node_name        = "pve"
#   clone_vm_id = each.value.clone_vm_id
#   ipv4_address = each.value.ipv4_address

# }




module "k3s_vms" {
  source           = "../modules/proxmox_clone"
  datastore_id     = "local"
  node_name        = "pve"
  cpu_cores        = 2
  disk_size        = 20
  network_bridge   = "vmbr0"
}


