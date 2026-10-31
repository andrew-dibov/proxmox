variable "storage_zfspool__storage__id" {
  type    = string
  default = "local-zfs-storage"
}

variable "storage_zfspool__storage__content" {
  type = list(string)
  default = [
    "images",
    "rootdir",
  ]
}

variable "storage_directory__snippets__id" {
  type    = string
  default = "local-snippets"
}

# ---

resource "proxmox_storage_zfspool" "storage_zfspool__storage" {
  nodes = [var.pve__node_name]

  zfs_pool = proxmox_node_disk_zfs.node_disk_zfs__pool.name

  id      = var.storage_zfspool__storage__id
  content = var.storage_zfspool__storage__content

  thin_provision = true

  depends_on = [proxmox_node_disk_zfs.node_disk_zfs__pool]
}

resource "proxmox_storage_directory" "storage_directory__snippets" {
  nodes = [var.pve__node_name]

  path = "/var/lib/vz/snippets"

  id      = var.storage_directory__snippets__id
  content = ["snippets"]

  create_base_path = true
  create_subdirs   = true
}
