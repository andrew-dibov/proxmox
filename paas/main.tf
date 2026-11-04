variable "pve__ip" {
  type      = string
  sensitive = true
}

variable "pve__endpoint" {
  type      = string
  sensitive = true
}

variable "pve__username" {
  type      = string
  sensitive = true
}

variable "pve__password" {
  type      = string
  sensitive = true
}

variable "pve__node_name" {
  type      = string
  sensitive = true
}

# ---

terraform {
  required_version = ">= 1.16.0"

  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.114.0"
    }

    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
  }
}

provider "proxmox" {
  endpoint = var.pve__endpoint
  username = var.pve__username
  password = var.pve__password

  insecure = true
}
