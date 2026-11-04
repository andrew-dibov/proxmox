variable "download_file__ubuntu_2204__postfix" {
  type    = string
  default = "-cloudimg.qcow2"
}

variable "download_file__ubuntu_2204__url" {
  type    = string
  default = "https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img"
}

variable "download_file__ubuntu_2204__content_type" {
  type    = string
  default = "import"
}

resource "proxmox_download_file" "download_file__ubuntu_2204" {
  node_name    = var.pve__node_name
  datastore_id = proxmox_storage_directory.proxmox_storage_directory__images.id

  file_name = "${local.ubuntu_2204__prefix}${var.download_file__ubuntu_2204__postfix}"
  url       = var.download_file__ubuntu_2204__url

  content_type = var.download_file__ubuntu_2204__content_type
  overwrite    = false
}

# ---

variable "download_file__ubuntu_2404__postfix" {
  type    = string
  default = "-cloudimg.qcow2"
}

variable "download_file__ubuntu_2404__url" {
  type    = string
  default = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"
}

variable "download_file__ubuntu_2404__content_type" {
  type    = string
  default = "import"
}

resource "proxmox_download_file" "download_file__ubuntu_2404" {
  node_name    = var.pve__node_name
  datastore_id = proxmox_storage_directory.proxmox_storage_directory__images.id

  file_name = "${local.ubuntu_2404__prefix}${var.download_file__ubuntu_2404__postfix}"
  url       = var.download_file__ubuntu_2404__url

  content_type = var.download_file__ubuntu_2404__content_type
  overwrite    = false
}
