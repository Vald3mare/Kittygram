terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">= 0.89.0"
    }
  }
}

provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = "ru-central1-b"
}

resource "yandex_vpc_network" "kittygram-network" {
  name = "kittygram-network"
}

resource "yandex_vpc_subnet" "kittygram-subnet" {
  name           = "kittygram-subnet"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.kittygram-network.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

resource "yandex_vpc_security_group" "kittygram-sg" {
  name       = "kittygram-sg"
  network_id = yandex_vpc_network.kittygram-network.id

  egress {
    protocol       = "ANY"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol       = "TCP"
    port           = 22
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol       = "TCP"
    port           = 80
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "yandex_compute_instance" "kittygram-vm" {
  name        = "kittygram-vm"
  platform_id = "standard-v1"
  zone        = "ru-central1-b"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd8vm252b1d56k17plft" # Ubuntu 22.04 LTS
      size     = 10
    }
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.kittygram-subnet.id
    nat                = true
    security_group_ids = [yandex_vpc_security_group.kittygram-sg.id]
  }

  metadata = {
    ssh-keys  = "ubuntu:${var.ssh_public_key}"
    user-data = file("${path.module}/cloud-config.yaml")
  }
}