# Spot Ocean GKE Terraform Module

# This module is deprecated and will be removed from the registry in 30 days.

# Following modules should be used instead -
- [For GKE Cluster Creation and Configuration](https://registry.terraform.io/modules/terraform-google-modules/kubernetes-engine/google/latest)
- [For Spot Ocean Cluster Creation in GCP](https://registry.terraform.io/modules/spotinst/ocean-gcp-k8s/spotinst/latest)
- [For Spot Ocean VNG Creation in GCP](https://registry.terraform.io/modules/spotinst/ocean-gcp-k8s-vng/spotinst/latest)

## This repository will not have active support any more.

---

A Terraform module to create a [Google Kubernetes Engine (GKE)](https://cloud.google.com/kubernetes-engine) cluster with [Spot Ocean](https://spot.io/products/ocean). The module will install the Ocean Controller into the cluster.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Examples](#examples)
- [Requirements](#requirements)
- [Providers](#providers)
- [Modules](#modules)
- [Resources](#resources)
- [Inputs](#inputs)
- [Outputs](#outputs)
- [Documentation](#documentation)
- [Getting Help](#getting-help)
- [Community](#community)
- [Contributing](#contributing)
- [License](#license)

## Prerequisites

For `kubectl` to connect and interface properly with your [Google Kubernetes Engine (GKE)](https://cloud.google.com/kubernetes-engine) cluster, you have to install the `gcloud` CLI. `gcloud` can be installed as a part of the [Google Cloud SDK](https://cloud.google.com/sdk/). Furthermore, for GCP, at least `Editor` permissions are needed to import an existing cluster. Instructions on how to install the following components can be found below:

- [gcloud](https://cloud.google.com/sdk/docs/install)
- [kubectl](https://kubernetes.io/docs/setup/production-environment/turnkey/gce/#installing-the-kubernetes-command-line-tools-on-your-workstation)

## Usage

```hcl
module "ocean-gke" {
  source = "spotinst/ocean-gke/spotinst"

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
```

## Examples

- [Simple Regional Cluster](https://github.com/spotinst/terraform-spotinst-ocean-gke/tree/master/examples/simple-regional)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.39.0, <4.0.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 1.10, != 1.11.0 |
| <a name="requirement_spotinst"></a> [spotinst](#requirement\_spotinst) | >= 1.39.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 3.39.0, <4.0.0 |
| <a name="provider_spotinst"></a> [spotinst](#provider\_spotinst) | >= 1.39.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gke"></a> [gke](#module\_gke) | terraform-google-modules/kubernetes-engine/google | >= 14.1.0 |
| <a name="module_ocean-controller"></a> [ocean-controller](#module\_ocean-controller) | spotinst/ocean-controller/spotinst | 0.19.0 |

## Resources

| Name | Type |
|------|------|
| [spotinst_ocean_gke_import.this](https://registry.terraform.io/providers/spotinst/spotinst/latest/docs/resources/ocean_gke_import) | resource |
| [spotinst_ocean_gke_launch_spec_import.this](https://registry.terraform.io/providers/spotinst/spotinst/latest/docs/resources/ocean_gke_launch_spec_import) | resource |
| [google_client_config.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_add_cluster_firewall_rules"></a> [add\_cluster\_firewall\_rules](#input\_add\_cluster\_firewall\_rules) | Create additional firewall rules | `bool` | `false` | no |
| <a name="input_basic_auth_password"></a> [basic\_auth\_password](#input\_basic\_auth\_password) | The password to be used with Basic Authentication | `string` | `""` | no |
| <a name="input_basic_auth_username"></a> [basic\_auth\_username](#input\_basic\_auth\_username) | The username to be used with Basic Authentication. An empty value will disable Basic Authentication, which is the recommended configuration | `string` | `""` | no |
| <a name="input_cluster_ipv4_cidr"></a> [cluster\_ipv4\_cidr](#input\_cluster\_ipv4\_cidr) | The IP address range of the kubernetes pods in this cluster. Default is an automatically assigned CIDR | `any` | `null` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the cluster (required) | `string` | n/a | yes |
| <a name="input_cluster_resource_labels"></a> [cluster\_resource\_labels](#input\_cluster\_resource\_labels) | The GCE resource labels (a map of key/value pairs) to be applied to the cluster | `map(string)` | `{}` | no |
| <a name="input_configure_ip_masq"></a> [configure\_ip\_masq](#input\_configure\_ip\_masq) | Enables the installation of ip masquerading, which is usually no longer required when using aliasied IP addresses. IP masquerading uses a kubectl call, so when you have a private cluster, you will need access to the API server | `bool` | `false` | no |
| <a name="input_controller_image"></a> [controller\_image](#input\_controller\_image) | Set the Docker image name for the Ocean Controller that should be deployed | `string` | `"gcr.io/spotinst-artifacts/kubernetes-cluster-controller"` | no |
| <a name="input_create_ocean"></a> [create\_ocean](#input\_create\_ocean) | Controls whether Ocean should be created (it affects all Ocean resources) | `bool` | `true` | no |
| <a name="input_create_service_account"></a> [create\_service\_account](#input\_create\_service\_account) | Defines if service account specified to run nodes should be created | `bool` | `true` | no |
| <a name="input_database_encryption"></a> [database\_encryption](#input\_database\_encryption) | Application-layer Secrets Encryption settings. The object format is {state = string, key\_name = string}. Valid values of state are: "ENCRYPTED"; "DECRYPTED". key\_name is the name of a CloudKMS key | `list(object({ state = string, key_name = string }))` | <pre>[<br>  {<br>    "key_name": "",<br>    "state": "DECRYPTED"<br>  }<br>]</pre> | no |
| <a name="input_default_max_pods_per_node"></a> [default\_max\_pods\_per\_node](#input\_default\_max\_pods\_per\_node) | The maximum number of pods to schedule per node | `number` | `110` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of the cluster | `string` | `""` | no |
| <a name="input_desired_capacity"></a> [desired\_capacity](#input\_desired\_capacity) | The number of worker nodes to launch and maintain in the Ocean cluster | `number` | `1` | no |
| <a name="input_disable_legacy_metadata_endpoints"></a> [disable\_legacy\_metadata\_endpoints](#input\_disable\_legacy\_metadata\_endpoints) | Disable the /0.1/ and /v1beta1/ metadata server endpoints on the node. Changing this value will cause all node pools to be recreated | `bool` | `true` | no |
| <a name="input_enable_binary_authorization"></a> [enable\_binary\_authorization](#input\_enable\_binary\_authorization) | Enable BinAuthZ Admission controller | `bool` | `false` | no |
| <a name="input_enable_network_egress_export"></a> [enable\_network\_egress\_export](#input\_enable\_network\_egress\_export) | Whether to enable network egress metering for this cluster. If enabled, a daemonset will be created in the cluster to meter network egress traffic | `bool` | `false` | no |
| <a name="input_enable_resource_consumption_export"></a> [enable\_resource\_consumption\_export](#input\_enable\_resource\_consumption\_export) | Whether to enable resource consumption metering on this cluster. When enabled, a table will be created in the resource export BigQuery dataset to store resource consumption data. The resulting table can be joined with the resource usage table or with BigQuery billing export | `bool` | `true` | no |
| <a name="input_firewall_inbound_ports"></a> [firewall\_inbound\_ports](#input\_firewall\_inbound\_ports) | List of TCP ports for admission/webhook controllers | `list(string)` | <pre>[<br>  "8443",<br>  "9443",<br>  "15017"<br>]</pre> | no |
| <a name="input_firewall_priority"></a> [firewall\_priority](#input\_firewall\_priority) | Priority rule for firewall rules | `number` | `1000` | no |
| <a name="input_gcloud_upgrade"></a> [gcloud\_upgrade](#input\_gcloud\_upgrade) | Whether to upgrade gcloud at runtime | `bool` | `false` | no |
| <a name="input_grant_registry_access"></a> [grant\_registry\_access](#input\_grant\_registry\_access) | Grants created cluster-specific service account storage.objectViewer role | `bool` | `false` | no |
| <a name="input_horizontal_pod_autoscaling"></a> [horizontal\_pod\_autoscaling](#input\_horizontal\_pod\_autoscaling) | Enable horizontal pod autoscaling addon | `bool` | `true` | no |
| <a name="input_http_load_balancing"></a> [http\_load\_balancing](#input\_http\_load\_balancing) | Enable httpload balancer addon | `bool` | `true` | no |
| <a name="input_identity_namespace"></a> [identity\_namespace](#input\_identity\_namespace) | Workload Identity namespace. (Default value of `enabled` automatically sets project based namespace `[project_id].svc.id.goog`) | `string` | `"enabled"` | no |
| <a name="input_image_pull_policy"></a> [image\_pull\_policy](#input\_image\_pull\_policy) | Image pull policy (one of: Always, Never, IfNotPresent) | `string` | `"Always"` | no |
| <a name="input_initial_node_count"></a> [initial\_node\_count](#input\_initial\_node\_count) | The number of nodes to create in this cluster's default node pool | `number` | `0` | no |
| <a name="input_instance_types"></a> [instance\_types](#input\_instance\_types) | A list of instance types | `list(string)` | `[]` | no |
| <a name="input_ip_masq_link_local"></a> [ip\_masq\_link\_local](#input\_ip\_masq\_link\_local) | Whether to masquerade traffic to the link-local prefix (169.254.0.0/16) | `bool` | `false` | no |
| <a name="input_ip_masq_resync_interval"></a> [ip\_masq\_resync\_interval](#input\_ip\_masq\_resync\_interval) | The interval at which the agent attempts to sync its ConfigMap file from the disk | `string` | `"60s"` | no |
| <a name="input_ip_range_pods"></a> [ip\_range\_pods](#input\_ip\_range\_pods) | The _name_ of the secondary subnet ip range to use for pods | `string` | n/a | yes |
| <a name="input_ip_range_services"></a> [ip\_range\_services](#input\_ip\_range\_services) | The _name_ of the secondary subnet range to use for services | `string` | n/a | yes |
| <a name="input_issue_client_certificate"></a> [issue\_client\_certificate](#input\_issue\_client\_certificate) | Issues a client certificate to authenticate to the cluster endpoint. To maximize the security of your cluster, leave this option disabled. Client certificates don't automatically rotate and aren't easily revocable. WARNING: changing this after cluster creation is destructive! | `bool` | `false` | no |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | The Kubernetes version of the masters. If set to 'latest' it will pull latest available version in the selected region | `string` | `"latest"` | no |
| <a name="input_logging_service"></a> [logging\_service](#input\_logging\_service) | The logging service that the cluster should write logs to. Available options include logging.googleapis.com, logging.googleapis.com/kubernetes (beta), and none | `string` | `"logging.googleapis.com/kubernetes"` | no |
| <a name="input_maintenance_start_time"></a> [maintenance\_start\_time](#input\_maintenance\_start\_time) | Time window specified for daily or recurring maintenance operations in RFC3339 format | `string` | `"05:00"` | no |
| <a name="input_master_authorized_networks"></a> [master\_authorized\_networks](#input\_master\_authorized\_networks) | List of master authorized networks. If none are provided, disallow external access (except the cluster node IPs, which GKE automatically whitelists) | `list(object({ cidr_block = string, display_name = string }))` | `[]` | no |
| <a name="input_max_size"></a> [max\_size](#input\_max\_size) | The upper limit of worker nodes the Ocean cluster can scale up to | `number` | `null` | no |
| <a name="input_min_size"></a> [min\_size](#input\_min\_size) | The lower limit of worker nodes the Ocean cluster can scale down to | `number` | `null` | no |
| <a name="input_monitoring_service"></a> [monitoring\_service](#input\_monitoring\_service) | The monitoring service that the cluster should write metrics to. Automatically send metrics from pods in the cluster to the Google Cloud Monitoring API. VM metrics will be collected by Google Compute Engine regardless of this setting Available options include monitoring.googleapis.com, monitoring.googleapis.com/kubernetes (beta) and none | `string` | `"monitoring.googleapis.com/kubernetes"` | no |
| <a name="input_network"></a> [network](#input\_network) | The VPC network to host the cluster in (required) | `string` | n/a | yes |
| <a name="input_network_policy"></a> [network\_policy](#input\_network\_policy) | Enable network policy addon | `bool` | `true` | no |
| <a name="input_network_policy_provider"></a> [network\_policy\_provider](#input\_network\_policy\_provider) | The network policy provider | `string` | `"CALICO"` | no |
| <a name="input_network_project_id"></a> [network\_project\_id](#input\_network\_project\_id) | The project ID of the shared VPC's host (for shared vpc support) | `string` | `""` | no |
| <a name="input_node_metadata"></a> [node\_metadata](#input\_node\_metadata) | Specifies how node metadata is exposed to the workload running on the node | `string` | `"GKE_METADATA_SERVER"` | no |
| <a name="input_node_pools"></a> [node\_pools](#input\_node\_pools) | List of maps containing node pools | `list(map(string))` | <pre>[<br>  {<br>    "autoscaling": false,<br>    "name": "default-node-pool",<br>    "node_count": 0<br>  }<br>]</pre> | no |
| <a name="input_node_pools_labels"></a> [node\_pools\_labels](#input\_node\_pools\_labels) | Map of maps containing node labels by node-pool name | `map(map(string))` | <pre>{<br>  "all": {},<br>  "default-node-pool": {}<br>}</pre> | no |
| <a name="input_node_pools_metadata"></a> [node\_pools\_metadata](#input\_node\_pools\_metadata) | Map of maps containing node metadata by node-pool name | `map(map(string))` | <pre>{<br>  "all": {},<br>  "default-node-pool": {}<br>}</pre> | no |
| <a name="input_node_pools_oauth_scopes"></a> [node\_pools\_oauth\_scopes](#input\_node\_pools\_oauth\_scopes) | Map of lists containing node oauth scopes by node-pool name | `map(list(string))` | <pre>{<br>  "all": [],<br>  "default-node-pool": []<br>}</pre> | no |
| <a name="input_node_pools_tags"></a> [node\_pools\_tags](#input\_node\_pools\_tags) | Map of lists containing node network tags by node-pool name | `map(list(string))` | <pre>{<br>  "all": [],<br>  "default-node-pool": []<br>}</pre> | no |
| <a name="input_node_pools_taints"></a> [node\_pools\_taints](#input\_node\_pools\_taints) | Map of lists containing node taints by node-pool name | `map(list(object({ key = string, value = string, effect = string })))` | <pre>{<br>  "all": [],<br>  "default-node-pool": []<br>}</pre> | no |
| <a name="input_non_masquerade_cidrs"></a> [non\_masquerade\_cidrs](#input\_non\_masquerade\_cidrs) | List of strings in CIDR notation that specify the IP address ranges that do not use IP masquerading | `list(string)` | <pre>[<br>  "10.0.0.0/8",<br>  "172.16.0.0/12",<br>  "192.168.0.0/16"<br>]</pre> | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The project ID to host the cluster in (required) | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The region to host the cluster in (optional if zonal cluster / required if regional) | `string` | `null` | no |
| <a name="input_regional"></a> [regional](#input\_regional) | Whether is a regional cluster (zonal cluster if set false. WARNING: changing this after cluster creation is destructive!) | `bool` | `true` | no |
| <a name="input_registry_project_ids"></a> [registry\_project\_ids](#input\_registry\_project\_ids) | Projects holding Google Container Registries. If empty, we use the cluster project. If a service account is created and the `grant_registry_access` variable is set to `true`, the `storage.objectViewer` role is assigned on these projects | `list(string)` | `[]` | no |
| <a name="input_release_channel"></a> [release\_channel](#input\_release\_channel) | The release channel of this cluster. Accepted values are `UNSPECIFIED`, `RAPID`, `REGULAR` and `STABLE`. Defaults to `UNSPECIFIED` | `string` | `null` | no |
| <a name="input_remove_default_node_pool"></a> [remove\_default\_node\_pool](#input\_remove\_default\_node\_pool) | Remove default node pool while setting up the cluster | `bool` | `true` | no |
| <a name="input_resource_usage_export_dataset_id"></a> [resource\_usage\_export\_dataset\_id](#input\_resource\_usage\_export\_dataset\_id) | The ID of a BigQuery Dataset for using BigQuery as the destination of resource usage export | `string` | `""` | no |
| <a name="input_service_account"></a> [service\_account](#input\_service\_account) | The service account to run nodes as if not overridden in `node_pools`. The create\_service\_account variable default value (true) will cause a cluster-specific service account to be created | `string` | `""` | no |
| <a name="input_skip_provisioners"></a> [skip\_provisioners](#input\_skip\_provisioners) | Flag to skip all local-exec provisioners. It breaks `stub_domains` and `upstream_nameservers` variables functionality | `bool` | `false` | no |
| <a name="input_spotinst_account"></a> [spotinst\_account](#input\_spotinst\_account) | Spot account ID | `string` | n/a | yes |
| <a name="input_spotinst_token"></a> [spotinst\_token](#input\_spotinst\_token) | Spot Personal Access token | `string` | n/a | yes |
| <a name="input_stub_domains"></a> [stub\_domains](#input\_stub\_domains) | Map of stub domains and their resolvers to forward DNS queries for a certain domain to an external DNS server | `map(list(string))` | `{}` | no |
| <a name="input_subnetwork"></a> [subnetwork](#input\_subnetwork) | The subnetwork to host the cluster in (required) | `string` | n/a | yes |
| <a name="input_upstream_nameservers"></a> [upstream\_nameservers](#input\_upstream\_nameservers) | If specified, the values replace the nameservers taken by default from the node’s /etc/resolv.conf | `list(string)` | `[]` | no |
| <a name="input_zones"></a> [zones](#input\_zones) | The zones to host the cluster in (optional if regional cluster / required if zonal) | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#output\_cluster\_ca\_certificate) | Cluster CA certificate (base64 encoded) |
| <a name="output_cluster_endpoint"></a> [cluster\_endpoint](#output\_cluster\_endpoint) | Cluster endpoint |
| <a name="output_cluster_horizontal_pod_autoscaling_enabled"></a> [cluster\_horizontal\_pod\_autoscaling\_enabled](#output\_cluster\_horizontal\_pod\_autoscaling\_enabled) | Whether horizontal pod autoscaling enabled |
| <a name="output_cluster_http_load_balancing_enabled"></a> [cluster\_http\_load\_balancing\_enabled](#output\_cluster\_http\_load\_balancing\_enabled) | Whether http load balancing enabled |
| <a name="output_cluster_location"></a> [cluster\_location](#output\_cluster\_location) | Cluster location (region if regional cluster, zone if zonal cluster) |
| <a name="output_cluster_logging_service"></a> [cluster\_logging\_service](#output\_cluster\_logging\_service) | Logging service used |
| <a name="output_cluster_master_version"></a> [cluster\_master\_version](#output\_cluster\_master\_version) | Current master kubernetes version |
| <a name="output_cluster_min_master_version"></a> [cluster\_min\_master\_version](#output\_cluster\_min\_master\_version) | Minimum master kubernetes version |
| <a name="output_cluster_monitoring_service"></a> [cluster\_monitoring\_service](#output\_cluster\_monitoring\_service) | Monitoring service used |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | Cluster name |
| <a name="output_cluster_network_policy_enabled"></a> [cluster\_network\_policy\_enabled](#output\_cluster\_network\_policy\_enabled) | Whether network policy enabled |
| <a name="output_cluster_node_pools_names"></a> [cluster\_node\_pools\_names](#output\_cluster\_node\_pools\_names) | List of node pools names |
| <a name="output_cluster_node_pools_versions"></a> [cluster\_node\_pools\_versions](#output\_cluster\_node\_pools\_versions) | List of node pools versions |
| <a name="output_cluster_region"></a> [cluster\_region](#output\_cluster\_region) | Cluster region |
| <a name="output_cluster_token"></a> [cluster\_token](#output\_cluster\_token) | OAuth2 access token used by the client to authenticate against the Google Cloud API |
| <a name="output_cluster_type"></a> [cluster\_type](#output\_cluster\_type) | Cluster type (regional / zonal) |
| <a name="output_cluster_zones"></a> [cluster\_zones](#output\_cluster\_zones) | List of zones in which the cluster resides |
| <a name="output_identity_namespace"></a> [identity\_namespace](#output\_identity\_namespace) | Workload Identity namespace |
| <a name="output_master_authorized_networks_config"></a> [master\_authorized\_networks\_config](#output\_master\_authorized\_networks\_config) | Networks from which access to master is permitted |
| <a name="output_ocean_cluster_id"></a> [ocean\_cluster\_id](#output\_ocean\_cluster\_id) | The ID of the Ocean cluster |
| <a name="output_ocean_controller_id"></a> [ocean\_controller\_id](#output\_ocean\_controller\_id) | The ID of the Ocean controller |
| <a name="output_release_channel"></a> [release\_channel](#output\_release\_channel) | The release channel of this cluster |
| <a name="output_service_account"></a> [service\_account](#output\_service\_account) | The service account to default running nodes as if not overridden in `node_pools` |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Documentation

If you're new to [Spot](https://spot.io/) and want to get started, please checkout our [Getting Started](https://docs.spot.io/connect-your-cloud-provider/) guide, available on the [Spot Documentation](https://docs.spot.io/) website.

## Getting Help

We use GitHub issues for tracking bugs and feature requests. Please use these community resources for getting help:

- Ask a question on [Stack Overflow](https://stackoverflow.com/) and tag it with [terraform-spotinst](https://stackoverflow.com/questions/tagged/terraform-spotinst/).
- Join our [Spot](https://spot.io/) community on [Slack](http://slack.spot.io/).
- Open an issue.

## Community

- [Slack](http://slack.spot.io/)
- [Twitter](https://twitter.com/spot_hq/)

## Contributing

Please see the [contribution guidelines](CONTRIBUTING.md).

## License

Code is licensed under the [Apache License 2.0](LICENSE).
