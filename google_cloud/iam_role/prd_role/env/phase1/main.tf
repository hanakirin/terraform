terraform {
  required_version = ">= 1.10.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.14.0"
    }
  }
}

provider "google" {
  project = "phase1"
}

module "main" {
  source = "../.."
  phase  = "phase1"
}

output "main" {
  value = module.main
}
