provider "spotinst" {
  token   = var.spotinst_token
  account = var.spotinst_account
}

provider "kubernetes" {
  load_config_file       = false
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}

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
  source  = "spotinst/ocean-controller/spotinst"
  version = ">= 0.10.0"

  # Workaround for backward compatibility with Terraform =<0.13.
  # Should be replaced with `count` and `depends_on` in the future.
  create_controller = var.create_ocean
  module_depends_on = [module.gke]

  # Credentials.
  spotinst_token   = var.spotinst_token
  spotinst_account = var.spotinst_account

  # Configuration.
  cluster_identifier = local.ocean_controller_id
}
