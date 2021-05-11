terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "2.20.0"
    }
  }
}

provider "cloudflare" {
  # Configuration options
  api_token = var.api_token
}
