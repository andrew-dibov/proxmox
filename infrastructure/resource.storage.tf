variable "storage_zfspool__storage0_id" {
  type = string
  default = "local-zfs-storage"
}

variable "storage_zfspool__storage0_thin_provision" {
  type = bool
  default = true
}

# ---

resource "proxmox_storage_zfspool" "storage_zfspool__storage0" {
  id = var.storage_zfspool__storage0_id
  nodes = [ var.pve__node_name ]

  zfs_pool = proxmox_node_disk_zfs.node_disk_zfs__pool0.name
  thin_provision = var.storage_zfspool__storage0_thin_provision

  depends_on = [ proxmox_node_disk_zfs.node_disk_zfs__pool0 ]
}