terraform {
  # ref: https://git.io/Jkmfj
  required_version = ">=0.12.6, <0.14"

  required_providers {
    spotinst   = ">= 1.27.0"
    kubernetes = ">= 1.13.0"
    google     = ">= 3.42.0"
  }
}
