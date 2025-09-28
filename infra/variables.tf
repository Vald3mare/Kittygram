variable "ssh_public_key" {
  type        = string
  description = "Public SSH key for accessing the VM"
}

variable "service_account_key_file" {
  type        = string
  description = "Path to the Yandex.Cloud service account key file"
}

variable "cloud_id" {
  type        = string
  description = "Yandex.Cloud cloud_id"
}

variable "folder_id" {
  type        = string
  description = "Yandex.Cloud folder_id"
}