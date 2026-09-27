variable "node_disk_zfs__pool0_name" {
  type = string
  default = "storage"
}

variable "node_disk_zfs__pool0_raidlevel" {
  type = string
  default = "raidz"
}

variable "node_disk_zfs__pool0_devices" {
  type = list(string)
  default = [
    "/dev/sda",
    "/dev/sdb",
    "/dev/sdc",
    "/dev/sdd",
  ]
}

# ---

resource "proxmox_node_disk_zfs" "node_disk_zfs__pool0" {
  node_name = var.pve__node_name
  name = var.node_disk_zfs__pool0_name

  raidlevel = var.node_disk_zfs__pool0_raidlevel
  devices = var.node_disk_zfs__pool0_devices

  cleanup_config = true
  cleanup_disks = true

  add_storage = false
}