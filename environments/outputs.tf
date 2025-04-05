output "vm" {
  value = {
    for k, m in module.k3s_vms :
    k => m.vm_info
  }
}
