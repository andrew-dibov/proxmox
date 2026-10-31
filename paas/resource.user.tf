variable "user__infrastructure__user_id" {
  type    = string
  default = "user-infrastructure@pve"
}

variable "user__network__user_id" {
  type    = string
  default = "user-network@pve"
}

# ---

resource "proxmox_virtual_environment_user" "user__infrastructure" {
  user_id = var.user__infrastructure__user_id
  enabled = true
}

resource "proxmox_virtual_environment_user" "user__network" {
  user_id = var.user__network__user_id
  enabled = true
}
