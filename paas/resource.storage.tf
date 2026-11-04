variable "proxmox_storage_zfspool__storage__id" {
  type    = string
  default = "storage"
}

variable "proxmox_storage_zfspool__storage__content" {
  type = list(string)
  default = [
    "images",
    "rootdir",
  ]
}

resource "proxmox_storage_zfspool" "proxmox_storage_zfspool__storage" {
  nodes = [var.pve__node_name]

  id      = var.proxmox_storage_zfspool__storage__id
  content = var.proxmox_storage_zfspool__storage__content

  zfs_pool       = proxmox_node_disk_zfs.node_disk_zfs__mpool.name
  thin_provision = true

  depends_on = [proxmox_node_disk_zfs.node_disk_zfs__mpool]
}

# ---

variable "proxmox_storage_directory__snippets__id" {
  type    = string
  default = "snippets"
}

variable "proxmox_storage_directory__snippets__content" {
  type = list(string)
  default = [
    "snippets",
  ]
}

variable "proxmox_storage_directory__snippets__path" {
  type    = string
  default = "/var/lib/vz/snippets"
}

resource "proxmox_storage_directory" "proxmox_storage_directory__snippets" {
  nodes = [var.pve__node_name]

  id      = var.proxmox_storage_directory__snippets__id
  content = var.proxmox_storage_directory__snippets__content

  path             = var.proxmox_storage_directory__snippets__path
  create_base_path = true
  create_subdirs   = true
}

# ---

variable "proxmox_storage_directory__images__id" {
  type    = string
  default = "images"
}

variable "proxmox_storage_directory__images__content" {
  type = list(string)
  default = [
    "iso",
    "vztmpl",
    "import",
  ]
}

variable "proxmox_storage_directory__images__path" {
  type    = string
  default = "/var/lib/vz/images"
}

resource "proxmox_storage_directory" "proxmox_storage_directory__images" {
  nodes = [var.pve__node_name]

  id      = var.proxmox_storage_directory__images__id
  content = var.proxmox_storage_directory__images__content

  path             = var.proxmox_storage_directory__images__path
  create_base_path = true
  create_subdirs   = true
}
