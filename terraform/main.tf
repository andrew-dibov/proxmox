variable "pm__api_url" {
  type = string
  description = "terraform.tfvars"
}

variable "pm__user" {
  type = string
  description = "terraform.tfvars"
}

variable "pm__password" {
  type = string
  description = "terraform.tfvars"
}

# ---

terraform {
  required_version = ">= 0.16"

  required_providers {
    proxmox = {
        source = "telmate/proxmox"
        version = "3.0.2-rc04" # proxmox 9.2.20
    }
  }
}

provider "proxmox" {
    pm_api_url = var.pm__api_url
    pm_tls_insecure = true

    pm_user = var.pm__user
    pm_password = var.pm__password
}
