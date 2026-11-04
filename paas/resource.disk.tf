variable "node_disk_zfs__pool__name" {
  type    = string
  default = "mpool"
}

variable "node_disk_zfs__pool__devices" {
  type = list(string)
  default = [
    "/dev/sda",
    "/dev/sdb",
    "/dev/sdc",
    "/dev/sdd",
  ]
}

variable "node_disk_zfs__pool__raidlevel" {
  type    = string
  default = "raidz"
}

resource "proxmox_node_disk_zfs" "node_disk_zfs__mpool" {
  node_name = var.pve__node_name

  name      = var.node_disk_zfs__pool__name
  devices   = var.node_disk_zfs__pool__devices
  raidlevel = var.node_disk_zfs__pool__raidlevel

  cleanup_config = true
  cleanup_disks  = true
  add_storage    = false
}
