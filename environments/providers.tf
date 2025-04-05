terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = "0.74.1"
    }
  }
}

provider "proxmox" {
endpoint = "https://pve.andrestrek.com/api2/json"
  username = "root@pam"
  password = "bsit113092"
  insecure = true

}