variable "pve__endpoint" {
  type        = string
  description = "terraform.tfvars"
  sensitive   = true
}

variable "pve__username" {
  type        = string
  description = "terraform.tfvars"
  sensitive   = true
}

variable "pve__password" {
  type        = string
  description = "terraform.tfvars"
  sensitive   = true
}

# ---

variable "pve__node_name" {
  type    = string
  default = "pve"
}

variable "pve__linux_bridge" {
  type    = string
  default = "vmbr1"
}

# ---

terraform {
  required_version = ">= 1.16.0"

  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.114.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }

    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

provider "proxmox" {
  endpoint = var.pve__endpoint
  username = var.pve__username
  password = var.pve__password

  insecure = true
}
