variable "vm__ubuntu_id" {
  type    = number
  default = 9000
}

variable "vm__ubuntu_name" {
  type    = string
  default = "ubuntu"
}

# ---

resource "proxmox_download_file" "file__ubuntu_image" {
  node_name    = var.pve__node_name
  datastore_id = "local"

  file_name = "ubuntu-noble-server-cloud-amd64.qcow2"
  url       = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"

  content_type = "import"
  overwrite    = false
}

# ---

resource "proxmox_virtual_environment_vm" "vm__ubuntu_noble_current" {
  node_name = var.pve__node_name

  vm_id = var.vm__ubuntu_id
  name  = var.vm__ubuntu_name

  cpu {
    cores = 1
    type  = "host"
  }

  memory {
    dedicated = 1024
  }

  disk {
    datastore_id = proxmox_storage_zfspool.storage_zfspool__storage0.id
    import_from  = proxmox_download_file.file__ubuntu_image.id
    interface    = "scsi0"
    file_format  = "raw"
    size         = 20
  }

  initialization {
    datastore_id = proxmox_storage_zfspool.storage_zfspool__storage0.id

    user_account {
      username = "ubuntu"
      password = "test1234"
      keys     = []
    }
  }

  agent { enabled = true }

  template = true
  started  = false

  depends_on = [proxmox_storage_zfspool.storage_zfspool__storage0]
}
