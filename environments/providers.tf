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

  # ssh {
  #   agent = true
  #   # TODO: uncomment and configure if using api_token instead of password
  #   username = "root"
  #   password = "bsit113092"
  # }

}

