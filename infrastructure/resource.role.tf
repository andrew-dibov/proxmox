variable "role__tenant_role_id" {
  type    = string
  default = "Tenant"
}

variable "role__tenant_privileges" {
  type = list(string)
  default = [
    "SDN.Allocate",
    "SDN.Audit",
    "SDN.Use",

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

resource "proxmox_virtual_environment_role" "role__tenant" {
  role_id = var.role__tenant_role_id
  privileges = var.role__tenant_privileges
}