resource "proxmox_virtual_environment_vm" "this" {
  name      = var.name
  node_name = var.node_name

  clone {
    vm_id = var.clone_vm_id
  }

  agent {
    enabled = var.agent_enabled
  }

  memory {
    dedicated = var.memory_dedicated
  }
  network_device {
    bridge = "vmbr0"
  }

  initialization {
    dns {
      servers = var.dns_servers
    }
    ip_config {
      ipv4 {
        address = var.ipv4_address
      }
    }
  }
}
