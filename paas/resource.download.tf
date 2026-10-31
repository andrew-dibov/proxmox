resource "proxmox_download_file" "download_file__ubuntu_22_04" {
  node_name    = var.pve__node_name
  datastore_id = "local"

  file_name = "jammy-server-cloudimg-amd64.qcow2"
  url       = "https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img"

  content_type = "import"
  overwrite    = false
}

resource "proxmox_download_file" "download_file__ubuntu_24_04" {
  node_name    = var.pve__node_name
  datastore_id = "local"

  file_name = "noble-server-cloudimg-amd64.qcow2"
  url       = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"

  content_type = "import"
  overwrite    = false
}

resource "proxmox_download_file" "download_file__ubuntu_26_04" {
  node_name    = var.pve__node_name
  datastore_id = "local"

  file_name = "resolute-server-cloudimg-amd64.qcow2"
  url       = "https://cloud-images.ubuntu.com/resolute/current/resolute-server-cloudimg-amd64.img"

  content_type = "import"
  overwrite    = false
}
