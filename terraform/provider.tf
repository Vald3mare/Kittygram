terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"

  backend "s3" {
    endpoint = "https://storage.yandexcloud.net"
    bucket = "bckps"
    region = "ru-central"
  }

}

provider "yandex" {
  zone = "<зона_доступности_по_умолчанию>"
}
