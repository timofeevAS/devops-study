# Настройка OpenStack provider [1]
# [1] https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs

terraform {
  required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.54.1"
    }
  }
}

# Configure the OpenStack Provider
provider "openstack" {
  user_name = var.username
  tenant_name = "students"
  password = var.userpassword
  auth_url = "https://cloud.crplab.ru:5000"
  tenant_id = "a02aed7892fa45d0bc2bef3b8a08a6e9" # id проекта из https://cloud.crplab.ru/identity/
  user_domain_name = "Default"
  region = "RegionOne"
}

# https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_secgroup_v2
resource "openstack_networking_secgroup_v2" "secgr" {
  name = "timofeev-group-trfm"
}

# https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_secgroup_rule_v2
resource "openstack_networking_secgroup_rule_v2" "secgr_ssh_rule" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol = "tcp"
  port_range_min = 22
  port_range_max = 22
  remote_ip_prefix = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.secgr.id
}

# https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/compute_instance_v2
resource "openstack_compute_instance_v2" "timofeev_server" {
  name = "timofeev-server-trfm"
  image_name = var.image_name
  flavor_name = var.server_flavor
  key_pair = var.key_pair
  security_groups = [openstack_networking_secgroup_v2.secgr.name]

  network {
    name = var.network_name
  }
}