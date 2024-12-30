terraform {
  required_version = ">= 1.10.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.14.0"
    }
  }
}

resource "google_project_iam_custom_role" "myRole" {
  role_id     = "aaaDevRole004"
  title       = "aaaDevRole004"
  project     = var.phase
  permissions = ["iam.roles.list", "iam.roles.create", "iam.roles.delete"]
}
