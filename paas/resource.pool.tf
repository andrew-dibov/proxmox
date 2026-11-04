variable "pool__net__pool_id" {
  type    = string
  default = "net"
}

resource "proxmox_virtual_environment_pool" "pool__net" {
  pool_id = var.pool__net__pool_id
}

# ---

variable "pool__infra__pool_id" {
  type    = string
  default = "infra"
}

resource "proxmox_virtual_environment_pool" "pool__infra" {
  pool_id = var.pool__infra__pool_id
}
