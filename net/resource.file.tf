variable "vm__vpn_gateway__cloud_init" {
  type    = string
  default = "snippets"
}

resource "proxmox_virtual_environment_file" "vm__vpn_gateway__cloud_init" {
  node_name = data.terraform_remote_state.remote_state__paas.outputs.pve__node_name

  content_type = var.vm__vpn_gateway__cloud_init
  datastore_id = data.terraform_remote_state.remote_state__paas.outputs.paas__storage__snippets_id

  source_raw {
    file_name = "vpn-gateway-cloudinit.yaml"
    data      = <<-EOF
      #cloud-config
      hostname: vpn-gateway
      fqdn: vpn-gateway.local

      timezone: "Asia/Yakutsk"
      locale: en_US.UTF-8

      disable_root: true
      manage_etc_hosts: true
      
      users:
        - name: net
          primary_group: net
          groups: [adm, sudo]
          sudo: ALL=(ALL) NOPASSWD:ALL
          lock_passwd: false
          shell: /bin/bash
      
      chpasswd:
        expire: false
        users:
          - {name: net, password: "test1234", type: text}
      
      package_update: true
      package_upgrade: false
      packages:
        - qemu-guest-agent
        - wireguard
        - iptables-persistent
      
      write_files:
        - path: /etc/sysctl.d/99-wireguard-forward.conf
          content: |
            net.ipv4.ip_forward=1
      
      runcmd:
        - systemctl enable --now qemu-guest-agent
        - systemctl enable --now ssh
        - sysctl -p /etc/sysctl.d/99-wireguard-forward.conf
        - |
          if [ ! -f /etc/wireguard/private.key ]; then
            umask 077
            wg genkey > /etc/wireguard/private.key
            wg pubkey < /etc/wireguard/private.key > /etc/wireguard/public.key
          fi
        - |
          cat << CONF > /etc/wireguard/wg0.conf
          [Interface]
          Address = 10.8.0.1/24
          ListenPort = 51820
          PrivateKey = $(cat /etc/wireguard/private.key)
          PostUp = iptables -A FORWARD -i wg0 -j ACCEPT; iptables -A FORWARD -o wg0 -j ACCEPT; iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
          PostDown = iptables -D FORWARD -i wg0 -j ACCEPT; iptables -D FORWARD -o wg0 -j ACCEPT; iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE
          CONF
        - systemctl enable --now wg-quick@wg0
    EOF
  }
}
