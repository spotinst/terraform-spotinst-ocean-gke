// Google's outputs

output "cluster_name" {
  description = "Cluster name"
  value       = module.gke.name
}

output "cluster_type" {
  description = "Cluster type (regional / zonal)"
  value       = module.gke.type
}

output "cluster_location" {
  description = "Cluster location (region if regional cluster, zone if zonal cluster)"
  value       = module.gke.location
}

output "cluster_region" {
  description = "Cluster region"
  value       = module.gke.region
}

output "cluster_zones" {
  description = "List of zones in which the cluster resides"
  value       = module.gke.zones
}

output "cluster_endpoint" {
  sensitive   = true
  description = "Cluster endpoint"
  value       = module.gke.endpoint
}

output "cluster_min_master_version" {
  description = "Minimum master kubernetes version"
  value       = module.gke.min_master_version
}

output "cluster_logging_service" {
  description = "Logging service used"
  value       = module.gke.logging_service
}

output "cluster_monitoring_service" {
  description = "Monitoring service used"
  value       = module.gke.monitoring_service
}

output "master_authorized_networks_config" {
  description = "Networks from which access to master is permitted"
  value       = module.gke.master_authorized_networks_config
}

output "cluster_master_version" {
  description = "Current master kubernetes version"
  value       = module.gke.master_version
}

output "cluster_ca_certificate" {
  sensitive   = true
  description = "Cluster ca certificate (base64 encoded)"
  value       = module.gke.ca_certificate
}

output "cluster_network_policy_enabled" {
  description = "Whether network policy enabled"
  value       = module.gke.network_policy_enabled
}

output "cluster_http_load_balancing_enabled" {
  description = "Whether http load balancing enabled"
  value       = module.gke.http_load_balancing_enabled
}

output "cluster_horizontal_pod_autoscaling_enabled" {
  description = "Whether horizontal pod autoscaling enabled"
  value       = module.gke.horizontal_pod_autoscaling_enabled
}

output "cluster_node_pools_names" {
  description = "List of node pools names"
  value       = compact(module.gke.node_pools_names)
}

output "cluster_node_pools_versions" {
  description = "List of node pools versions"
  value       = compact(module.gke.node_pools_versions)
}

output "service_account" {
  description = "The service account to default running nodes as if not overridden in `node_pools`"
  value       = module.gke.service_account
}

output "release_channel" {
  description = "The release channel of this cluster"
  value       = module.gke.release_channel
}

output "identity_namespace" {
  description = "Workload Identity namespace"
  value       = module.gke.identity_namespace
}

output "client_token" {
  sensitive   = true
  description = "OAuth2 access token used by the client to authenticate against the Google Cloud API"
  value       = base64encode(data.google_client_config.default.access_token)
}

// Spot's outputs

output "ocean_cluster_id" {
  description = "The ID of the Ocean cluster"
  value       = local.ocean_cluster_id
}

output "ocean_controller_id" {
  description = "The ID of the Ocean controller"
  value       = local.ocean_controller_id
}
