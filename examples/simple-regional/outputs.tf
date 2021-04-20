// region terraform-google-modules/kubernetes-engine

output "cluster_name" {
  description = "Cluster name"
  value       = module.ocean-gke.cluster_name
}

output "cluster_type" {
  description = "Cluster type (regional / zonal)"
  value       = module.ocean-gke.cluster_type
}

output "cluster_location" {
  description = "Cluster location (region if regional cluster, zone if zonal cluster)"
  value       = module.ocean-gke.cluster_location
}

output "cluster_region" {
  description = "Cluster region"
  value       = module.ocean-gke.cluster_region
}

output "cluster_zones" {
  description = "List of zones in which the cluster resides"
  value       = module.ocean-gke.cluster_zones
}

output "cluster_endpoint" {
  sensitive   = true
  description = "Cluster endpoint"
  value       = module.ocean-gke.cluster_endpoint
}

output "cluster_token" {
  sensitive   = true
  description = "OAuth2 access token used by the client to authenticate against the Google Cloud API"
  value       = module.ocean-gke.cluster_token
}

output "cluster_min_master_version" {
  description = "Minimum master kubernetes version"
  value       = module.ocean-gke.cluster_min_master_version
}

output "cluster_logging_service" {
  description = "Logging service used"
  value       = module.ocean-gke.cluster_logging_service
}

output "cluster_monitoring_service" {
  description = "Monitoring service used"
  value       = module.ocean-gke.cluster_monitoring_service
}

output "master_authorized_networks_config" {
  description = "Networks from which access to master is permitted"
  value       = module.ocean-gke.master_authorized_networks_config
}

output "cluster_master_version" {
  description = "Current master kubernetes version"
  value       = module.ocean-gke.cluster_master_version
}

output "cluster_ca_certificate" {
  sensitive   = true
  description = "Cluster ca certificate (base64 encoded)"
  value       = module.ocean-gke.cluster_ca_certificate
}

output "cluster_network_policy_enabled" {
  description = "Whether network policy enabled"
  value       = module.ocean-gke.cluster_network_policy_enabled
}

output "cluster_http_load_balancing_enabled" {
  description = "Whether http load balancing enabled"
  value       = module.ocean-gke.cluster_http_load_balancing_enabled
}

output "cluster_horizontal_pod_autoscaling_enabled" {
  description = "Whether horizontal pod autoscaling enabled"
  value       = module.ocean-gke.cluster_horizontal_pod_autoscaling_enabled
}

output "cluster_node_pools_names" {
  description = "List of node pools names"
  value       = module.ocean-gke.cluster_node_pools_names
}

output "cluster_node_pools_versions" {
  description = "List of node pools versions"
  value       = module.ocean-gke.cluster_node_pools_versions
}

output "service_account" {
  description = "The service account to default running nodes as if not overridden in `node_pools`"
  value       = module.ocean-gke.service_account
}

output "release_channel" {
  description = "The release channel of this cluster"
  value       = module.ocean-gke.release_channel
}

output "identity_namespace" {
  description = "Workload Identity namespace"
  value       = module.ocean-gke.identity_namespace
}

// endregion

// region spotinst/ocean-gke

output "ocean_cluster_id" {
  description = "The ID of the Ocean cluster"
  value       = module.ocean-gke.ocean_cluster_id
}

output "ocean_controller_id" {
  description = "The ID of the Ocean controller"
  value       = module.ocean-gke.ocean_controller_id
}

// endregion
