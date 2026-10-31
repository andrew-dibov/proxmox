resource "proxmox_virtual_environment_file" "vm__ubuntu_22_04__cloud_init" {
  node_name = var.pve__node_name

  content_type = "snippets"
  datastore_id = proxmox_storage_directory.storage_directory__snippets.id

  source_raw {
    data = <<-EOF
      #cloud-config
      hostname: jammy
      timezone: Asia/Yakutsk
      users:
        - name: devops
          shell: /bin/bash
          sudo: ALL=(ALL) NOPASSWD:ALL
      chpasswd:
        expire: false
        users:
          - {name: devops, password: "test1234", type: text}
      package_update: true
      packages:
        - qemu-guest-agent
      runcmd:
        - systemctl enable qemu-guest-agent
        - systemctl start qemu-guest-agent
    EOF

    file_name = "jammy-cloud-init.yaml"
  }
}

resource "proxmox_virtual_environment_file" "vm__ubuntu_24_04__cloud_init" {
  node_name = var.pve__node_name

  content_type = "snippets"
  datastore_id = proxmox_storage_directory.storage_directory__snippets.id

  source_raw {
    data = <<-EOF
      #cloud-config
      hostname: noble
      timezone: Asia/Yakutsk
      users:
        - name: devops
          shell: /bin/bash
          sudo: ALL=(ALL) NOPASSWD:ALL
      chpasswd:
        expire: false
        users:
          - {name: devops, password: "test1234", type: text}
      package_update: true
      packages:
        - qemu-guest-agent
      runcmd:
        - systemctl enable qemu-guest-agent
        - systemctl start qemu-guest-agent
    EOF

    file_name = "noble-cloud-init.yaml"
  }
}

resource "proxmox_virtual_environment_file" "vm__ubuntu_26_04__cloud_init" {
  node_name = var.pve__node_name

  content_type = "snippets"
  datastore_id = proxmox_storage_directory.storage_directory__snippets.id

  source_raw {
    data = <<-EOF
      #cloud-config
      hostname: resolute
      timezone: Asia/Yakutsk
      users:
        - name: devops
          shell: /bin/bash
          sudo: ALL=(ALL) NOPASSWD:ALL
      chpasswd:
        expire: false
        users:
          - {name: devops, password: "test1234", type: text}
      package_update: true
      packages:
        - qemu-guest-agent
      runcmd:
        - systemctl enable qemu-guest-agent
        - systemctl start qemu-guest-agent
    EOF

    file_name = "resolute-cloud-init.yaml"
  }
}
