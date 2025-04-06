resource "proxmox_virtual_environment_vm" "ubuntu_vm" {
  name        = var.vm_name
  description = "Managed by Terraform"
  tags        = ["terraform", "ubuntu", "k3s"]
  node_name = var.node_name
  vm_id     = var.vm_id

  agent {
    enabled = false
  }

  stop_on_destroy = true

  startup {
    order      = "3"
    up_delay   = "60"
    down_delay = "60"
  }

  cpu {
    cores = var.cpu_cores
    type  = var.cpu_type
    flags = []
  }

  memory {
    dedicated = var.memory_mb
    floating  = var.memory_mb
  }

  disk {
    datastore_id = var.disk_datastore_id
    file_id      = "local:iso/ubuntu-24.04.2-live-server-amd64.iso"
    interface    = "virtio0"
    iothread     = true
    discard      = "on"
    size         = 20
    file_format = "qcow2"
  }

  initialization {
    user_data_file_id = proxmox_virtual_environment_file.user_data_cloud_config.id
    interface = "ide2"

    ip_config {
      ipv4 {
        address = var.ipv4_address
      }
    }


    user_account {
      keys     = [file("~/.ssh/id_rsa.pub")]
      password = "bsit113092"
      username = "k3s_admin"
    }
  }

  network_device {
    bridge = "vmbr0"
    disconnected = false
  }

  operating_system {
    type = "l26"
  }

  tpm_state {
    version = "v2.0"
  }

  serial_device {}
}

resource "proxmox_virtual_environment_file" "user_data_cloud_config" {
  content_type = "snippets"
  datastore_id = "local"
  node_name    = "pve"


  source_raw {
    data = <<-EOF
    #cloud-config
    hostname: ${var.hostname}
    timezone: Asia/Manila
    users:
      - default
      - name: k3s_admin
        groups:
          - sudo
        shell: /bin/bash
        sudo: ALL=(ALL) NOPASSWD:ALL
    package_update: true
    packages:
      - qemu-guest-agent
      - net-tools
      - curl
    runcmd:
      - systemctl enable qemu-guest-agent
      - systemctl start qemu-guest-agent
      - echo "done" > /tmp/cloud-config.done
    EOF
    file_name = "userdata.yaml"
  }
}