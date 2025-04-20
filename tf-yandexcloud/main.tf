terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  token     = var.YC_TOKEN
  cloud_id  = var.YC_CLOUD_ID
  folder_id = var.YC_FOLDER_ID
  zone      = "ru-central1-a"
}

resource "yandex_compute_disk" "timofeev-disk" {
  name     = "timofeev-disk"
  type     = "network-hdd"
  zone     = "ru-central1-a"
  size     = "20"
  image_id = "fd833v6c5tb0udvk4jo6" # https://yandex.cloud/ru/marketplace/products/yc/ubuntu-22-04-lts
}

resource "yandex_compute_instance" "vm-1" {
  name = "timofeev-trfm"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    disk_id = yandex_compute_disk.timofeev-disk.id
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.timofeev-subnet.id
    nat       = true
  }

  metadata = {
    user-data = "${file("meta.txt")}"
  }
}

data "yandex_vpc_network" "default" {
  name = "default"
}

resource "yandex_vpc_subnet" "timofeev-subnet" {
  name           = "timofeev-subnet"
  zone           = "ru-central1-a"
  network_id     = data.yandex_vpc_network.default.id
  v4_cidr_blocks = ["192.168.199.0/24"]
}


resource "yandex_vpc_security_group" "group1" {
  name        = "timofeev-sg"
  network_id  = data.yandex_vpc_network.default.id
}

resource "yandex_vpc_security_group_rule" "ssh-rule" {
  security_group_binding = yandex_vpc_security_group.group1.id
  direction              = "ingress"
  description            = "timofeev ssh"
  v4_cidr_blocks         = ["0.0.0.0/32"]
  port                   = 22
  protocol               = "TCP"
}
