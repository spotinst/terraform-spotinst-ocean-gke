locals {
  ocean_cluster_id    = element(concat(spotinst_ocean_gke_import.this.*.id, [""]), 0)
  ocean_controller_id = element(concat(spotinst_ocean_gke_import.this.*.cluster_controller_id, [""]), 0)
}
