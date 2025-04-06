variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
}

variable "node_name" {
  description = "Proxmox node to deploy the VM on"
  type        = string
}

variable "vm_id" {
  description = "ID of the VM"
  type        = number
}

variable "cpu_cores" {
  description = "Number of CPU cores"
  type        = number
  default     = 2
}

variable "cpu_type" {
  description = "CPU type"
  type        = string
  default     = "x86-64-v2-AES"
}

variable "memory_mb" {
  description = "Memory size in MB"
  type        = number
  default     = 2048
}

variable "disk_datastore_id" {
  description = "Datastore ID for the VM disk"
  type        = string
}

variable "iso_datastore_id" {
  description = "Datastore ID for the ISO image"
  type        = string
}

variable "iso_node_name" {
  description = "Node name for ISO download"
  type        = string
}

variable "network_bridge" {
  description = "Bridge to connect network device"
  type        = string
  default     = "vmbr0"
}

variable "vm_username" {
  description = "Default username for the VM"
  type        = string
  default     = "ubuntu"
}

variable "clone_vm_id" {
  description = "ID of the VM to clone from"
  type        = number
}

variable "ipv4_address" {
  description = "ipv4 address"
  type = string
  
}

variable "hostname" {
  description = "hostname"
  type = string
  
}