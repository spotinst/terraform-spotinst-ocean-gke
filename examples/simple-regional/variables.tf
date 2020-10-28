variable "spotinst_token" {
  type        = string
  description = "Spot Personal Access token"
}

variable "spotinst_account" {
  type        = string
  description = "Spot account ID"
}

variable "project_id" {
  type        = string
  description = "The project ID to host the cluster in (required)"
}

variable "cluster_name" {
  type        = string
  description = "The name of the cluster (required)"
}

variable "regional" {
  type        = bool
  description = "Whether is a regional cluster (zonal cluster if set false. WARNING: changing this after cluster creation is destructive!)"
  default     = true
}

variable "region" {
  type        = string
  description = "The region to host the cluster in (optional if zonal cluster / required if regional)"
  default     = null
}

variable "zones" {
  type        = list(string)
  description = "The zones to host the cluster in (optional if regional cluster / required if zonal)"
  default     = []
}

variable "network" {
  type        = string
  description = "The VPC network to host the cluster in"
}

variable "subnetwork" {
  type        = string
  description = "The subnetwork to host the cluster in"
}

variable "ip_range_pods" {
  type        = string
  description = "The secondary ip range to use for pods"
}

variable "ip_range_services" {
  type        = string
  description = "The secondary ip range to use for services"
}

variable "create_service_account" {
  type        = bool
  description = "Defines if service account specified to run nodes should be created."
  default     = true
}

variable "service_account" {
  type        = string
  description = "Service account to associate to the nodes in the cluster"
  default     = ""
}
