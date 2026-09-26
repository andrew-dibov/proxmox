resource "proxmox_virtual_environment_role" "role__tnnt10" {
  role_id = "Tennant10"

  privileges = [
    "VM.Allocate",
    "VM.Config.CPU",
    "VM.Config.Memory",
    "VM.Config.Disk",
    "VM.Config.Network",
    "VM.Config.Options",
    "VM.Config.Cloudinit",
    "VM.Clone",
    "VM.PowerMgmt",
    "VM.Audit",
    "VM.Console",
    "Datastore.AllocateSpace",
    "Datastore.Audit",
    "Datastore.AllocateTemplate",
    "SDN.Use",
  ]
}

resource "proxmox_virtual_environment_user" "user__tnnt10" {
  user_id = "tf-tnnt10@pve"
}

resource "proxmox_acl" "acl__tnnt10_pool" {
  path      = "/pool/tnnt10"
  propagate = true

  role_id = proxmox_virtual_environment_role.role__tnnt10.id
  user_id = proxmox_virtual_environment_user.user__tnnt10.id
}

resource "proxmox_acl" "acl__tnnt10_sdn" {
  path = "/sdn/zones/tnnt10"

  role_id = proxmox_virtual_environment_role.role__tnnt10.id
  user_id = proxmox_virtual_environment_user.user__tnnt10.id
}
