terraform {
  required_providers {
    proxmox = {
        source  = "Telmate/proxmox"
        version = "3.0.1-rc8"
    }
  }
}

provider "proxmox" {
    pm_api_url = var.PM_API_URL
    pm_api_token_id    = var.PM_API_TOKEN_ID
    pm_api_token_secret = var.PM_API_TOKEN_SECRET
    pm_tls_insecure    = true
}