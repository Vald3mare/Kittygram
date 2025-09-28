variable "vm_name" {
  type        = string
  description = "Virtual machine name"
  default     = "kittygram-vm"
}

variable "ssh_username" {
  type        = string
  description = "Username for SSH access"
  default     = "ubuntu"
}

variable "ssh_key_content" {
  type        = string
  description = "Content of the public SSH key"
  sensitive   = true
}

# variable "service_account_key_file" {
#   type        = string
#   description = "Path to the Yandex.Cloud service account key file"
# }

variable "cloud_id" {
  type        = string
  description = "Yandex.Cloud cloud_id"
}

variable "folder_id" {
  type        = string
  description = "Yandex.Cloud folder_id"
}