variable "role__infrastructure__role_id" {
  type    = string
  default = "Infrastructure"
}

variable "role__infrastructure__privileges" {
  type = list(string)
  default = [
    "Pool.Allocate",

    "VM.Allocate",
    "VM.Clone",
    "VM.PowerMgmt",

    "VM.Config.CPU",
    "VM.Config.Memory",
    "VM.Config.Disk",
    "VM.Config.Network",
    "VM.Config.Options",
    "VM.Config.Cloudinit",

    "Datastore.AllocateSpace",
    "Datastore.Audit",
  ]
}

variable "role__network__role_id" {
  type    = string
  default = "Network"
}

variable "role__network__privileges" {
  type = list(string)
  default = [
    "Pool.Allocate",
  ]
}

# ---

resource "proxmox_virtual_environment_role" "role__infrastructure" {
  role_id    = var.role__infrastructure__role_id
  privileges = var.role__infrastructure__privileges
}

resource "proxmox_virtual_environment_role" "role__network" {
  role_id    = var.role__network__role_id
  privileges = var.role__network__privileges
}
