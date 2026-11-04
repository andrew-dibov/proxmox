variable "vm__ubuntu_2204__cloud_init__content_type" {
  type    = string
  default = "snippets"
}

variable "vm__ubuntu_2204__cloud_init__postfix" {
  type    = string
  default = "-cloudinit.yaml"
}

resource "proxmox_virtual_environment_file" "vm__ubuntu_2204__cloud_init" {
  node_name = var.pve__node_name

  content_type = var.vm__ubuntu_2204__cloud_init__content_type
  datastore_id = proxmox_storage_directory.proxmox_storage_directory__snippets.id

  source_raw {
    file_name = "${local.ubuntu_2204__prefix}${var.vm__ubuntu_2204__cloud_init__postfix}"
    data      = <<-EOF
      #cloud-config
      hostname: ${local.ubuntu_2204__prefix}-template
      fqdn: ${local.ubuntu_2204__prefix}-template.local

      timezone: ${local.ubuntu_2204__timezone}
      locale: en_US.UTF-8

      disable_root: true
      manage_etc_hosts: true
      
      users:
        - name: test
          primary_group: test
          groups: [adm, sudo]
          sudo: ALL=(ALL) NOPASSWD:ALL
          lock_passwd: false
          shell: /bin/bash
      
      chpasswd:
        expire: false
        users:
          - {name: test, password: "test1234", type: text}
      
      package_update: true
      package_upgrade: false
      packages:
        - qemu-guest-agent
      
      runcmd:
        - systemctl enable --now qemu-guest-agent
        - systemctl enable --now ssh
    EOF
  }
}

# ---

variable "vm__ubuntu_2404__cloud_init__content_type" {
  type    = string
  default = "snippets"
}

variable "vm__ubuntu_2404__cloud_init__postfix" {
  type    = string
  default = "-cloudinit.yaml"
}

resource "proxmox_virtual_environment_file" "vm__ubuntu_2404__cloud_init" {
  node_name = var.pve__node_name

  content_type = var.vm__ubuntu_2404__cloud_init__content_type
  datastore_id = proxmox_storage_directory.proxmox_storage_directory__snippets.id

  source_raw {
    file_name = "${local.ubuntu_2404__prefix}${var.vm__ubuntu_2404__cloud_init__postfix}"
    data      = <<-EOF
      #cloud-config
      hostname: ${local.ubuntu_2404__prefix}-template
      fqdn: ${local.ubuntu_2404__prefix}-template.local

      timezone: ${local.ubuntu_2404__timezone}
      locale: en_US.UTF-8

      disable_root: true
      manage_etc_hosts: true
      
      users:
        - name: test
          primary_group: test
          groups: [adm, sudo]
          sudo: ALL=(ALL) NOPASSWD:ALL
          lock_passwd: false
          shell: /bin/bash
      
      chpasswd:
        expire: false
        users:
          - {name: test, password: "test1234", type: text}
      
      package_update: true
      package_upgrade: false
      packages:
        - qemu-guest-agent
      
      runcmd:
        - systemctl enable --now qemu-guest-agent
        - systemctl enable --now ssh
    EOF
  }
}
