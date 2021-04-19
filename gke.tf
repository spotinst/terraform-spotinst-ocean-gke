module "gke" {
  source  = "terraform-google-modules/kubernetes-engine/google"
  version = ">= 14.1.0"

  project_id                         = var.project_id
  name                               = var.cluster_name
  description                        = var.description
  regional                           = var.regional
  region                             = var.region
  zones                              = var.zones
  network                            = var.network
  network_project_id                 = var.network_project_id
  subnetwork                         = var.subnetwork
  kubernetes_version                 = var.kubernetes_version
  master_authorized_networks         = var.master_authorized_networks
  horizontal_pod_autoscaling         = var.horizontal_pod_autoscaling
  http_load_balancing                = var.http_load_balancing
  network_policy                     = var.network_policy
  network_policy_provider            = var.network_policy_provider
  maintenance_start_time             = var.maintenance_start_time
  ip_range_pods                      = var.ip_range_pods
  ip_range_services                  = var.ip_range_services
  initial_node_count                 = var.initial_node_count
  remove_default_node_pool           = var.remove_default_node_pool
  disable_legacy_metadata_endpoints  = var.disable_legacy_metadata_endpoints
  resource_usage_export_dataset_id   = var.resource_usage_export_dataset_id
  enable_network_egress_export       = var.enable_network_egress_export
  enable_resource_consumption_export = var.enable_resource_consumption_export
  stub_domains                       = var.stub_domains
  upstream_nameservers               = var.upstream_nameservers
  non_masquerade_cidrs               = var.non_masquerade_cidrs
  ip_masq_resync_interval            = var.ip_masq_resync_interval
  ip_masq_link_local                 = var.ip_masq_link_local
  configure_ip_masq                  = var.configure_ip_masq
  logging_service                    = var.logging_service
  monitoring_service                 = var.monitoring_service
  create_service_account             = var.create_service_account
  grant_registry_access              = var.grant_registry_access
  registry_project_ids               = var.registry_project_ids
  service_account                    = var.service_account
  basic_auth_username                = var.basic_auth_username
  basic_auth_password                = var.basic_auth_password
  issue_client_certificate           = var.issue_client_certificate
  cluster_ipv4_cidr                  = var.cluster_ipv4_cidr
  cluster_resource_labels            = var.cluster_resource_labels
  skip_provisioners                  = var.skip_provisioners
  default_max_pods_per_node          = var.default_max_pods_per_node
  node_metadata                      = var.node_metadata
  database_encryption                = var.database_encryption
  identity_namespace                 = var.identity_namespace
  release_channel                    = var.release_channel
  enable_binary_authorization        = var.enable_binary_authorization
  add_cluster_firewall_rules         = var.add_cluster_firewall_rules
  firewall_priority                  = var.firewall_priority
  firewall_inbound_ports             = var.firewall_inbound_ports
  gcloud_upgrade                     = var.gcloud_upgrade
  node_pools                         = var.node_pools
  node_pools_labels                  = var.node_pools_labels
  node_pools_metadata                = var.node_pools_metadata
  node_pools_taints                  = var.node_pools_taints
  node_pools_tags                    = var.node_pools_tags
  node_pools_oauth_scopes            = var.node_pools_oauth_scopes

  # Disable Shielded Nodes features on all nodes to allow Ocean nodes to join the cluster.
  # Ref: https://cloud.google.com/kubernetes-engine/docs/how-to/shielded-gke-nodes
  enable_shielded_nodes = false
}

data "google_client_config" "default" {}
