variable "datastore_id" {
  description = "The datastore ID where VM files will be stored"
  type        = string
}

variable "node_name" {
  description = "The Proxmox node name where VM will be created"
  type        = string
}

variable "ubuntu_cloud_image_url" {
  description = "URL to the Ubuntu cloud image"
  type        = string
  default     = "https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img"
}

variable "cpu_cores" {
  description = "Number of CPU cores for the VM"
  type        = number
  default     = 2
}

variable "memory_dedicated" {
  description = "Amount of dedicated memory (in MB) for the VM"
  type        = number
  default     = 2048
}

variable "disk_datastore_id" {
  description = "The datastore ID where the disk will be stored"
  type        = string
  default     = "local-lvm"
}

variable "disk_size" {
  description = "Size of the disk (in GB)"
  type        = number
  default     = 20
}

variable "network_bridge" {
  description = "The network bridge to connect the VM"
  type        = string
  default     = "vmbr0"
}

variable "ipv4_address" {
  description = "IPv4 address for the VM"
  type        = string
  default     = "dhcp"
  
}

