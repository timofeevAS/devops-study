output "external_ip_address_vm_1" {
  value     = yandex_compute_instance.vm-1.network_interface.0.nat_ip_address
}

output "internal_ip_address_vm_1" {
  value     = yandex_compute_instance.vm-1.network_interface.0.ip_address
}

output "servers" {
  value = {
    serverip = yandex_compute_instance.vm-1.network_interface.0.nat_ip_address
  }
}