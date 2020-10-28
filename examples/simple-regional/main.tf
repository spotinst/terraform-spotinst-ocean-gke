module "ocean-gke" {
  source = "../../"

  # Credentials.
  spotinst_token   = var.spotinst_token
  spotinst_account = var.spotinst_account

  # Configuration.
  project_id             = var.project_id
  cluster_name           = var.cluster_name
  regional               = var.regional
  region                 = var.region
  zones                  = var.zones
  network                = var.network
  subnetwork             = var.subnetwork
  ip_range_pods          = var.ip_range_pods
  ip_range_services      = var.ip_range_services
  service_account        = var.service_account
  create_service_account = var.create_service_account
}
