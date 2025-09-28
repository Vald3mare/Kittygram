variable "ssh_public_key" {
  type        = string
  description = "Public SSH key for accessing the VM"
}

variable "yc_token" {
  type        = string
  description = "Yandex.Cloud static access key"
  sensitive   = true
}

variable "cloud_id" {
  type        = string
  description = "Yandex.Cloud cloud_id"
}

variable "folder_id" {
  type        = string
  description = "Yandex.Cloud folder_id"
}