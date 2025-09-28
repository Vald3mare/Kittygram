terraform{
    backend "s3" {
      endpoint = "https://storage.yandexcloud.net"
      bucket = "vald3mar-kittygram-tf"
      region = "ru-central1"
      key = "terraform.tfstate"

      skip_region_validation      = true
      skip_credentials_validation = true
    }
}