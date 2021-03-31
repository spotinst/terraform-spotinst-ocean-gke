# Simple Regional Cluster

This example illustrates how to create a simple regional cluster.

## Usage

To provision this example, run the following from within this directory:
- `terraform init` to get the plugins
- `terraform plan` to see the infrastructure plan
- `terraform apply` to apply the infrastructure build
- `terraform destroy` to destroy the built infrastructure

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ocean-gke"></a> [ocean-gke](#module\_ocean-gke) | ../../ |  |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the cluster (required) | `string` | n/a | yes |
| <a name="input_create_service_account"></a> [create\_service\_account](#input\_create\_service\_account) | Defines if service account specified to run nodes should be created. | `bool` | `true` | no |
| <a name="input_ip_range_pods"></a> [ip\_range\_pods](#input\_ip\_range\_pods) | The secondary ip range to use for pods | `string` | n/a | yes |
| <a name="input_ip_range_services"></a> [ip\_range\_services](#input\_ip\_range\_services) | The secondary ip range to use for services | `string` | n/a | yes |
| <a name="input_network"></a> [network](#input\_network) | The VPC network to host the cluster in | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The project ID to host the cluster in (required) | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The region to host the cluster in (optional if zonal cluster / required if regional) | `string` | `null` | no |
| <a name="input_regional"></a> [regional](#input\_regional) | Whether is a regional cluster (zonal cluster if set false. WARNING: changing this after cluster creation is destructive!) | `bool` | `true` | no |
| <a name="input_service_account"></a> [service\_account](#input\_service\_account) | Service account to associate to the nodes in the cluster | `string` | `""` | no |
| <a name="input_spotinst_account"></a> [spotinst\_account](#input\_spotinst\_account) | Spot account ID | `string` | n/a | yes |
| <a name="input_spotinst_token"></a> [spotinst\_token](#input\_spotinst\_token) | Spot Personal Access token | `string` | n/a | yes |
| <a name="input_subnetwork"></a> [subnetwork](#input\_subnetwork) | The subnetwork to host the cluster in | `string` | n/a | yes |
| <a name="input_zones"></a> [zones](#input\_zones) | The zones to host the cluster in (optional if regional cluster / required if zonal) | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_client_token"></a> [client\_token](#output\_client\_token) | OAuth2 access token used by the client to authenticate against the Google Cloud API |
| <a name="output_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#output\_cluster\_ca\_certificate) | Cluster ca certificate (base64 encoded) |
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
| <a name="output_cluster_type"></a> [cluster\_type](#output\_cluster\_type) | Cluster type (regional / zonal) |
| <a name="output_cluster_zones"></a> [cluster\_zones](#output\_cluster\_zones) | List of zones in which the cluster resides |
| <a name="output_identity_namespace"></a> [identity\_namespace](#output\_identity\_namespace) | Workload Identity namespace |
| <a name="output_master_authorized_networks_config"></a> [master\_authorized\_networks\_config](#output\_master\_authorized\_networks\_config) | Networks from which access to master is permitted |
| <a name="output_ocean_cluster_id"></a> [ocean\_cluster\_id](#output\_ocean\_cluster\_id) | The ID of the Ocean cluster |
| <a name="output_ocean_controller_id"></a> [ocean\_controller\_id](#output\_ocean\_controller\_id) | The ID of the Ocean controller |
| <a name="output_release_channel"></a> [release\_channel](#output\_release\_channel) | The release channel of this cluster |
| <a name="output_service_account"></a> [service\_account](#output\_service\_account) | The service account to default running nodes as if not overridden in `node_pools` |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
