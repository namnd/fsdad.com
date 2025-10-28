locals {
  cloudflare_account_id = "b45e6b6ab8976d9189ad6e38d29e44b1"
}

resource "cloudflare_pages_project" "fsdad_com" {

  account_id = local.cloudflare_account_id

  name = "fsdad-com"

  production_branch = "main"

  source = {
    type = "github"
    config = {
      repo_name                      = "fsdad.com"
      owner                          = "namnd"
      deployments_enabled            = true
      path_excludes                  = []
      path_includes                  = ["*"]
      pr_comments_enabled            = true
      preview_deployment_setting     = "all"
      preview_branch_excludes        = []
      preview_branch_includes        = ["*"]
      production_branch              = "main"
      production_deployments_enabled = true
    }
  }

  build_config = {
    build_command   = "npm install --save-dev tailwindcss @tailwindcss/cli && hugo"
    root_dir        = ""
    destination_dir = "public"
  }

  deployment_configs = {
    preview = {
      compatibility_date  = "2025-09-27"
      compatibility_flags = []
    }
    production = {
      compatibility_date  = "2025-09-27"
      compatibility_flags = []
    }
  }
}

resource "cloudflare_pages_domain" "fsdad_com" {
  account_id   = local.cloudflare_account_id
  project_name = cloudflare_pages_project.fsdad_com.name
  name         = "fsdad.com"
}

