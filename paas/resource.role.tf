variable "role__net__role_id" {
  type    = string
  default = "Net"
}

variable "role__net__privileges" {
  type = list(string)
  default = [
    "SDN.Allocate",
    "SDN.Audit",
    "SDN.Use",

    "Pool.Allocate",
    "Datastore.Audit",
    "Datastore.Allocate",
    "Datastore.AllocateSpace",

    "VM.Allocate",
    "VM.Clone",
    "VM.Audit",
    "VM.PowerMgmt",

    "VM.Config.CPU",
    "VM.Config.Memory",
    "VM.Config.Disk",
    "VM.Config.CDROM",
    "VM.Config.Network",
    "VM.Config.Options",
    "VM.Config.Cloudinit",
    "VM.GuestAgent.Audit",
  ]
}

resource "proxmox_virtual_environment_role" "role__net" {
  role_id    = var.role__net__role_id
  privileges = var.role__net__privileges
}

# ---

variable "role__infra__role_id" {
  type    = string
  default = "Infra"
}

variable "role__infra__privileges" {
  type = list(string)
  default = [
    "SDN.Use",

    "Pool.Allocate",
    "Datastore.Audit",
    "Datastore.Allocate",
    "Datastore.AllocateSpace",

    "VM.Allocate",
    "VM.Clone",
    "VM.Audit",
    "VM.PowerMgmt",

    "VM.Config.CPU",
    "VM.Config.Memory",
    "VM.Config.Disk",
    "VM.Config.CDROM",
    "VM.Config.Network",
    "VM.Config.Options",
    "VM.Config.Cloudinit",
    "VM.GuestAgent.Audit",
  ]
}

resource "proxmox_virtual_environment_role" "role__infra" {
  role_id    = var.role__infra__role_id
  privileges = var.role__infra__privileges
}

# ---
