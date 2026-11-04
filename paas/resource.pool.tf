variable "pool__infra__pool_id" {
  type    = string
  default = "infra"
}

# ---

resource "proxmox_virtual_environment_pool" "pool__infra" {
  pool_id = var.pool__infra__pool_id
}
