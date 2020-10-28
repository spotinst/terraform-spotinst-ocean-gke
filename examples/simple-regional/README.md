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

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cluster\_name | The name of the cluster (required) | `string` | n/a | yes |
| create\_service\_account | Defines if service account specified to run nodes should be created. | `bool` | `true` | no |
| ip\_range\_pods | The secondary ip range to use for pods | `string` | n/a | yes |
| ip\_range\_services | The secondary ip range to use for services | `string` | n/a | yes |
| network | The VPC network to host the cluster in | `string` | n/a | yes |
| project\_id | The project ID to host the cluster in (required) | `string` | n/a | yes |
| region | The region to host the cluster in (optional if zonal cluster / required if regional) | `string` | `null` | no |
| regional | Whether is a regional cluster (zonal cluster if set false. WARNING: changing this after cluster creation is destructive!) | `bool` | `true` | no |
| service\_account | Service account to associate to the nodes in the cluster | `string` | `""` | no |
| spotinst\_account | Spot account ID | `string` | n/a | yes |
| spotinst\_token | Spot Personal Access token | `string` | n/a | yes |
| subnetwork | The subnetwork to host the cluster in | `string` | n/a | yes |
| zones | The zones to host the cluster in (optional if regional cluster / required if zonal) | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| client\_token | OAuth2 access token used by the client to authenticate against the Google Cloud API |
| cluster\_ca\_certificate | Cluster ca certificate (base64 encoded) |
| cluster\_endpoint | Cluster endpoint |
| cluster\_horizontal\_pod\_autoscaling\_enabled | Whether horizontal pod autoscaling enabled |
| cluster\_http\_load\_balancing\_enabled | Whether http load balancing enabled |
| cluster\_location | Cluster location (region if regional cluster, zone if zonal cluster) |
| cluster\_logging\_service | Logging service used |
| cluster\_master\_version | Current master kubernetes version |
| cluster\_min\_master\_version | Minimum master kubernetes version |
| cluster\_monitoring\_service | Monitoring service used |
| cluster\_name | Cluster name |
| cluster\_network\_policy\_enabled | Whether network policy enabled |
| cluster\_node\_pools\_names | List of node pools names |
| cluster\_node\_pools\_versions | List of node pools versions |
| cluster\_region | Cluster region |
| cluster\_type | Cluster type (regional / zonal) |
| cluster\_zones | List of zones in which the cluster resides |
| identity\_namespace | Workload Identity namespace |
| master\_authorized\_networks\_config | Networks from which access to master is permitted |
| ocean\_cluster\_id | The ID of the Ocean cluster |
| ocean\_controller\_id | The ID of the Ocean controller |
| release\_channel | The release channel of this cluster |
| service\_account | The service account to default running nodes as if not overridden in `node_pools` |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
