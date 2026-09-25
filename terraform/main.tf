variable "pve__endpoint" {
  type = string
  description = "terraform.tfvars"
}

variable "pve__username" {
  type = string
  description = "terraform.tfvars"
}

variable "pve__password" {
  type = string
  description = "terraform.tfvars"
}

# ---

terraform {
  required_version = ">= 1.16.0"
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0.106"
    }
  }
}

provider "proxmox" {
  endpoint = var.pve__endpoint
  username = var.pve__username
  password = var.pve__password

  insecure = true
}
