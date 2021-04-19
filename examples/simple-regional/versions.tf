terraform {
  required_version = ">= 0.13.0"

  required_providers {
    spotinst = {
      source  = "spotinst/spotinst"
      version = ">= 1.38.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 1.10, != 1.11.0"
    }
    google = {
      source  = "hashicorp/google"
      version = ">= 3.39.0, <4.0.0"
    }
  }
}
