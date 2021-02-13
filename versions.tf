terraform {
  # ref: https://git.io/Jto5L
  required_version = ">= 0.12.26"

  required_providers {
    spotinst = {
      source  = "spotinst/spotinst"
      version = ">= 1.27.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 1.13.0"
    }
    google = {
      source  = "hashicorp/google"
      version = ">= 3.56.0"
    }
  }
}
