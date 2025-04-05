variable "name" {
  description = "Name of the VM"
  type        = string
  default     = null
}

variable "node_name" {
  description = "Name of the Proxmox node"
  type        = string
  default     = "pve"
}

variable "clone_vm_id" {
  description = "ID of the VM to clone"
  type        = number
  default     = 108
}

variable "agent_enabled" {
  description = "Whether the agent is enabled"
  type        = bool
  default     = false
}

variable "memory_dedicated" {
  description = "Dedicated memory in MB"
  type        = number
  default     = 1024
}

variable "dns_servers" {
  description = "List of DNS servers"
  type        = list(string)
  default     = ["192.168.254.105", "1.1.1.1"]
}

variable "ipv4_address" {
  description = "IPv4 address (e.g., 'dhcp' or static address)"
  type        = string
  default     = "dhcp"
}
