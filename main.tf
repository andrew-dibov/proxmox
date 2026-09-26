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

variable "pve__node_name" {
  type = string
  default = "proxmox"
}

variable "pve__datastore_id" {
  type = string
  default = "storage-zfs"
}

# ---

terraform {
  required_version = ">= 1.16.0"
  required_providers {
    proxmox = {                             
      source  = "bpg/proxmox"
      version = "~> 0.106"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.6.1"
    }
  }
}

provider "proxmox" {
  endpoint = var.pve__endpoint
  username = var.pve__username
  password = var.pve__password

  insecure = true
}
