output "debug_username" {
  value     = var.username
  sensitive = true
}

output "debug_userpassword" {
  value     = var.userpassword
  sensitive = true
}

output "servers" {
  value = {
    serverip = openstack_compute_instance_v2.timofeev_server.access_ip_v4
  }
}