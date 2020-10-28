# Spot Ocean GKE Terraform Module

A Terraform module to create a [Google Kubernetes Engine (GKE)](https://cloud.google.com/kubernetes-engine) cluster with [Spot Ocean](https://spot.io/products/ocean). The module will install the Ocean Controller into the cluster.

## Table of Contents

- [Usage](#usage)
- [Prerequisites](#prerequisites)
- [Examples](#examples)
- [Resources](#resources)
- [Requirements](#requirements)
- [Providers](#providers)
- [Inputs](#inputs)
- [Outputs](#outputs)
- [Documentation](#documentation)
- [Getting Help](#getting-help)
- [Community](#community)
- [Contributing](#contributing)
- [License](#license)

## Prerequisites

For `kubectl` to connect and interface properly with your [Google Kubernetes Engine (GKE)](https://cloud.google.com/kubernetes-engine) cluster, you have to install the `gcloud` CLI. `gcloud` can be installed as a part of the [Google Cloud SDK](https://cloud.google.com/sdk/). Instructions on how to install the following components can be found below:

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

## Resources

This module creates and manages the following resources:

- google_container_cluster
- google_container_node_pool
- spotinst_ocean_gke_import
- spotinst_ocean_gke_launch_spec_import

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >=0.12.6, <0.14 |
| google | >= 3.42.0 |
| kubernetes | >= 1.13.0 |
| spotinst | >= 1.27.0 |

## Providers

| Name | Version |
|------|---------|
| google | >= 3.42.0 |
| spotinst | >= 1.27.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| add\_cluster\_firewall\_rules | Create additional firewall rules | `bool` | `false` | no |
| basic\_auth\_password | The password to be used with Basic Authentication | `string` | `""` | no |
| basic\_auth\_username | The username to be used with Basic Authentication. An empty value will disable Basic Authentication, which is the recommended configuration | `string` | `""` | no |
| cluster\_ipv4\_cidr | The IP address range of the kubernetes pods in this cluster. Default is an automatically assigned CIDR | `any` | `null` | no |
| cluster\_name | The name of the cluster (required) | `string` | n/a | yes |
| cluster\_resource\_labels | The GCE resource labels (a map of key/value pairs) to be applied to the cluster | `map(string)` | `{}` | no |
| configure\_ip\_masq | Enables the installation of ip masquerading, which is usually no longer required when using aliasied IP addresses. IP masquerading uses a kubectl call, so when you have a private cluster, you will need access to the API server | `bool` | `false` | no |
| create\_ocean | Controls whether Ocean should be created (it affects all Ocean resources) | `bool` | `true` | no |
| create\_service\_account | Defines if service account specified to run nodes should be created | `bool` | `true` | no |
| database\_encryption | Application-layer Secrets Encryption settings. The object format is {state = string, key\_name = string}. Valid values of state are: "ENCRYPTED"; "DECRYPTED". key\_name is the name of a CloudKMS key | `list(object({ state = string, key_name = string }))` | <pre>[<br>  {<br>    "key_name": "",<br>    "state": "DECRYPTED"<br>  }<br>]</pre> | no |
| default\_max\_pods\_per\_node | The maximum number of pods to schedule per node | `number` | `110` | no |
| description | The description of the cluster | `string` | `""` | no |
| desired\_capacity | The number of worker nodes to launch and maintain in the Ocean cluster | `number` | `1` | no |
| disable\_legacy\_metadata\_endpoints | Disable the /0.1/ and /v1beta1/ metadata server endpoints on the node. Changing this value will cause all node pools to be recreated | `bool` | `true` | no |
| enable\_binary\_authorization | Enable BinAuthZ Admission controller | `bool` | `false` | no |
| enable\_network\_egress\_export | Whether to enable network egress metering for this cluster. If enabled, a daemonset will be created in the cluster to meter network egress traffic | `bool` | `false` | no |
| enable\_resource\_consumption\_export | Whether to enable resource consumption metering on this cluster. When enabled, a table will be created in the resource export BigQuery dataset to store resource consumption data. The resulting table can be joined with the resource usage table or with BigQuery billing export | `bool` | `true` | no |
| firewall\_inbound\_ports | List of TCP ports for admission/webhook controllers | `list(string)` | <pre>[<br>  "8443",<br>  "9443",<br>  "15017"<br>]</pre> | no |
| firewall\_priority | Priority rule for firewall rules | `number` | `1000` | no |
| gcloud\_upgrade | Whether to upgrade gcloud at runtime | `bool` | `false` | no |
| grant\_registry\_access | Grants created cluster-specific service account storage.objectViewer role | `bool` | `false` | no |
| horizontal\_pod\_autoscaling | Enable horizontal pod autoscaling addon | `bool` | `true` | no |
| http\_load\_balancing | Enable httpload balancer addon | `bool` | `true` | no |
| identity\_namespace | Workload Identity namespace. (Default value of `enabled` automatically sets project based namespace `[project_id].svc.id.goog`) | `string` | `"enabled"` | no |
| initial\_node\_count | The number of nodes to create in this cluster's default node pool | `number` | `0` | no |
| instance\_types | A list of instance types | `list(string)` | `[]` | no |
| ip\_masq\_link\_local | Whether to masquerade traffic to the link-local prefix (169.254.0.0/16) | `bool` | `false` | no |
| ip\_masq\_resync\_interval | The interval at which the agent attempts to sync its ConfigMap file from the disk | `string` | `"60s"` | no |
| ip\_range\_pods | The _name_ of the secondary subnet ip range to use for pods | `string` | n/a | yes |
| ip\_range\_services | The _name_ of the secondary subnet range to use for services | `string` | n/a | yes |
| issue\_client\_certificate | Issues a client certificate to authenticate to the cluster endpoint. To maximize the security of your cluster, leave this option disabled. Client certificates don't automatically rotate and aren't easily revocable. WARNING: changing this after cluster creation is destructive! | `bool` | `false` | no |
| kubernetes\_version | The Kubernetes version of the masters. If set to 'latest' it will pull latest available version in the selected region | `string` | `"latest"` | no |
| logging\_service | The logging service that the cluster should write logs to. Available options include logging.googleapis.com, logging.googleapis.com/kubernetes (beta), and none | `string` | `"logging.googleapis.com/kubernetes"` | no |
| maintenance\_start\_time | Time window specified for daily or recurring maintenance operations in RFC3339 format | `string` | `"05:00"` | no |
| master\_authorized\_networks | List of master authorized networks. If none are provided, disallow external access (except the cluster node IPs, which GKE automatically whitelists) | `list(object({ cidr_block = string, display_name = string }))` | `[]` | no |
| max\_size | The upper limit of worker nodes the Ocean cluster can scale up to | `number` | `null` | no |
| min\_size | The lower limit of worker nodes the Ocean cluster can scale down to | `number` | `null` | no |
| monitoring\_service | The monitoring service that the cluster should write metrics to. Automatically send metrics from pods in the cluster to the Google Cloud Monitoring API. VM metrics will be collected by Google Compute Engine regardless of this setting Available options include monitoring.googleapis.com, monitoring.googleapis.com/kubernetes (beta) and none | `string` | `"monitoring.googleapis.com/kubernetes"` | no |
| network | The VPC network to host the cluster in (required) | `string` | n/a | yes |
| network\_policy | Enable network policy addon | `bool` | `true` | no |
| network\_policy\_provider | The network policy provider | `string` | `"CALICO"` | no |
| network\_project\_id | The project ID of the shared VPC's host (for shared vpc support) | `string` | `""` | no |
| node\_metadata | Specifies how node metadata is exposed to the workload running on the node | `string` | `"GKE_METADATA_SERVER"` | no |
| node\_pools | List of maps containing node pools | `list(map(string))` | <pre>[<br>  {<br>    "autoscaling": false,<br>    "name": "default-node-pool",<br>    "node_count": 0<br>  }<br>]</pre> | no |
| node\_pools\_labels | Map of maps containing node labels by node-pool name | `map(map(string))` | <pre>{<br>  "all": {},<br>  "default-node-pool": {}<br>}</pre> | no |
| node\_pools\_metadata | Map of maps containing node metadata by node-pool name | `map(map(string))` | <pre>{<br>  "all": {},<br>  "default-node-pool": {}<br>}</pre> | no |
| node\_pools\_oauth\_scopes | Map of lists containing node oauth scopes by node-pool name | `map(list(string))` | <pre>{<br>  "all": [],<br>  "default-node-pool": []<br>}</pre> | no |
| node\_pools\_tags | Map of lists containing node network tags by node-pool name | `map(list(string))` | <pre>{<br>  "all": [],<br>  "default-node-pool": []<br>}</pre> | no |
| node\_pools\_taints | Map of lists containing node taints by node-pool name | `map(list(object({ key = string, value = string, effect = string })))` | <pre>{<br>  "all": [],<br>  "default-node-pool": []<br>}</pre> | no |
| non\_masquerade\_cidrs | List of strings in CIDR notation that specify the IP address ranges that do not use IP masquerading | `list(string)` | <pre>[<br>  "10.0.0.0/8",<br>  "172.16.0.0/12",<br>  "192.168.0.0/16"<br>]</pre> | no |
| project\_id | The project ID to host the cluster in (required) | `string` | n/a | yes |
| region | The region to host the cluster in (optional if zonal cluster / required if regional) | `string` | `null` | no |
| regional | Whether is a regional cluster (zonal cluster if set false. WARNING: changing this after cluster creation is destructive!) | `bool` | `true` | no |
| registry\_project\_id | Project holding the Google Container Registry. If empty, we use the cluster project. If grant\_registry\_access is true, storage.objectViewer role is assigned on this project | `string` | `""` | no |
| release\_channel | The release channel of this cluster. Accepted values are `UNSPECIFIED`, `RAPID`, `REGULAR` and `STABLE`. Defaults to `UNSPECIFIED` | `string` | `null` | no |
| remove\_default\_node\_pool | Remove default node pool while setting up the cluster | `bool` | `true` | no |
| resource\_usage\_export\_dataset\_id | The ID of a BigQuery Dataset for using BigQuery as the destination of resource usage export | `string` | `""` | no |
| service\_account | The service account to run nodes as if not overridden in `node_pools`. The create\_service\_account variable default value (true) will cause a cluster-specific service account to be created | `string` | `""` | no |
| skip\_provisioners | Flag to skip all local-exec provisioners. It breaks `stub_domains` and `upstream_nameservers` variables functionality | `bool` | `false` | no |
| spotinst\_account | Spot account ID | `string` | n/a | yes |
| spotinst\_token | Spot Personal Access token | `string` | n/a | yes |
| stub\_domains | Map of stub domains and their resolvers to forward DNS queries for a certain domain to an external DNS server | `map(list(string))` | `{}` | no |
| subnetwork | The subnetwork to host the cluster in (required) | `string` | n/a | yes |
| upstream\_nameservers | If specified, the values replace the nameservers taken by default from the node’s /etc/resolv.conf | `list(string)` | `[]` | no |
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
