terraform {
  backend "s3" {
    bucket       = "fsdad-com"
    key          = "infra.tfstate"
    region       = "ap-southeast-2"
    use_lockfile = true
  }

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5"
    }
  }
}

provider "aws" {
  region = "ap-southeast-2"
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}
