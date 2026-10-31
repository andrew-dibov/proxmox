variable "pool__infrastructure__pool_id" {
  type    = string
  default = "infrastructure"
}

variable "pool__network__pool_id" {
  type    = string
  default = "network"
}

# ---

resource "proxmox_virtual_environment_pool" "pool__infrastructure" {
  pool_id = var.pool__infrastructure__pool_id
}

resource "proxmox_virtual_environment_pool" "pool__network" {
  pool_id = var.pool__network__pool_id
}
