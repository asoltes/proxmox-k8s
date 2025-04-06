resource "proxmox_virtual_environment_download_file" "ubuntu_cloud_image" {
  content_type = "iso"
  datastore_id = var.datastore_id
  node_name    = var.node_name

  url = var.ubuntu_cloud_image_url
}

resource "proxmox_virtual_environment_vm" "ubuntu_template" {
  name      = "ubuntu-template"
  node_name = var.node_name

  template = true
  started  = false

  machine     = "q35"
  bios        = "ovmf"
  description = "Managed by Terraform"

  cpu {
    cores = var.cpu_cores
  }

  memory {
    dedicated = var.memory_dedicated
  }

  efi_disk {
    datastore_id = "local-lvm"
    type         = "4m"
  }

  disk {
    datastore_id = var.disk_datastore_id
    file_id      = proxmox_virtual_environment_download_file.ubuntu_cloud_image.id
    interface    = "virtio0"
    iothread     = true
    discard      = "on"
    size         = var.disk_size
  }

  initialization {
    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }

    user_data_file_id = proxmox_virtual_environment_file.user_data_cloud_config.id
  }

  network_device {
    bridge = var.network_bridge
  }
}

resource "proxmox_virtual_environment_vm" "this" {
  name      = var.node_name
  node_name = var.node_name

  clone {
    vm_id = 108
  }

  agent {
    enabled = true
  }

  memory {
    dedicated = var.memory_dedicated
  }
  network_device {
    bridge = "vmbr0"
  }

  initialization {
    user_data_file_id = proxmox_virtual_environment_file.user_data_cloud_config.id
    dns {
      servers = ["192.168.254.105", "8.8.8.8"]
    }
    ip_config {
      ipv4 {
        address = var.ipv4_address
      }
    }
  }

  depends_on = [ proxmox_virtual_environment_file.user_data_cloud_config]
}

resource "proxmox_virtual_environment_file" "user_data_cloud_config" {
  content_type = "snippets"
  datastore_id = "local"
  node_name    = "pve"


  source_raw {
    data = <<-EOF
    #cloud-config
    hostname: ${var.node_name}
    language: en_US:en
    manage_etc_hosts: true
    ssh_pwauth: true
    ssh_authorized_keys:
      - ${file("~/.ssh/id_rsa.pub")}          
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
      - sudo hostnamectl set-hostname ${var.node_name}

    EOF
    file_name = "userdata.yaml"
  }
}