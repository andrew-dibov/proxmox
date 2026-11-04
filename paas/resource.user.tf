variable "user__net__user_id" {
  type    = string
  default = "net@pve"
}

resource "proxmox_virtual_environment_user" "user__net" {
  user_id = var.user__net__user_id
  enabled = true
}

# ---

variable "user__infra__user_id" {
  type    = string
  default = "infra@pve"
}

resource "proxmox_virtual_environment_user" "user__infra" {
  user_id = var.user__infra__user_id
  enabled = true
}

# ---
