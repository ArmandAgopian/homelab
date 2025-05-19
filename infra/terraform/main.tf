terraform {
  required_providers {
    proxmox = {
        source  = "Telmate/proxmox"
        version = "3.0.1-rc8"
    }
  }
}

provider "proxmox" {
    pm_api_url = "https://${var.PM_API_HOSTNAME}:8006/api2/json"
    pm_api_token_id    = var.PM_API_TOKEN_ID
    pm_api_token_secret = var.PM_API_TOKEN_SECRET
    pm_tls_insecure    = true
}

resource "proxmox_lxc" "k3s_node" {
  vmid        = 100
  target_node = "proxmox"
  ostemplate  = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
  hostname    = "k3s-node"
  cores       = 2
  memory      = 5120

  rootfs {
    storage = "local-lvm"
    size    = "20G"
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    hwaddr = "BC:24:11:9C:84:24"
    ip     = "dhcp"
  }

  ssh_public_keys = var.SSH_PUBLIC_KEYS
  onboot = true
  features {
    nesting = true
  }

  # DOES NOT CONNECT TO INTERNET WITHOUT BELOW LINE
  unprivileged = true
  
  # Web UI does not work without shell
  cmode = "shell"
}