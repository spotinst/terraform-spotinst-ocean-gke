resource "spotinst_ocean_gke_import" "this" {
  count      = var.create_ocean ? 1 : 0
  depends_on = [module.gke]

  location         = module.gke.location
  cluster_name     = var.cluster_name
  max_size         = var.max_size
  min_size         = var.min_size
  desired_capacity = var.desired_capacity
  whitelist        = var.instance_types
}

resource "spotinst_ocean_gke_launch_spec_import" "this" {
  count = var.create_ocean && length(var.node_pools) > 0 ? 1 : 0

  ocean_id       = spotinst_ocean_gke_import.this[count.index].id
  node_pool_name = var.node_pools[count.index].name
}

module "ocean-controller" {
  # TODO: upgrade to v0.23.0 once GKE supports hashicorp/kubernetes >2.
  source     = "spotinst/ocean-controller/spotinst"
  version    = "0.19.0"
  depends_on = [module.gke]

  create_controller  = var.create_ocean
  spotinst_token     = var.spotinst_token
  spotinst_account   = var.spotinst_account
  controller_image   = var.controller_image
  image_pull_policy  = var.image_pull_policy
  cluster_identifier = local.ocean_controller_id
}
