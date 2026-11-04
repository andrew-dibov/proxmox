variable "user_token__net__token_name" {
  type    = string
  default = "net"
}

resource "proxmox_user_token" "user_token__net" {
  token_name = var.user_token__net__token_name
  user_id    = proxmox_virtual_environment_user.user__net.user_id

  privileges_separation = true
}

# ---

variable "user_token__infra__token_name" {
  type    = string
  default = "infra"
}

resource "proxmox_user_token" "user_token__infra" {
  token_name = var.user_token__infra__token_name
  user_id    = proxmox_virtual_environment_user.user__infra.user_id

  privileges_separation = true
}

# ---

