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

  ssh {
    agent    = false
    username = "root"
    private_key = tls_private_key.proxmox_ssh.private_key_openssh
  }
}

# ---

resource "tls_private_key" "proxmox_ssh" {
  algorithm = "ED25519"
}

resource "local_file" "private_key" {
  content         = tls_private_key.proxmox_ssh.private_key_openssh
  filename        = "${path.module}/id_ed25519"
  file_permission = "0600"
}

resource "local_file" "public_key" {
  content  = tls_private_key.proxmox_ssh.public_key_openssh
  filename = "${path.module}/id_ed25519.pub"
}