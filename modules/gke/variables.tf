variable "cluster_name" {
  description = "GKE cluster name"
  type        = string
}

variable "region" {
  description = "GCP region for the cluster"
  type        = string
}

variable "vpc_self_link" {
  description = "Self link of the VPC network"
  type        = string
}

variable "subnet_self_link" {
  description = "Self link of the subnet to use for GKE nodes"
  type        = string
}

variable "machine_type" {
  description = "Machine type for GKE nodes (module expects 'machine_type')"
  type        = string
}

variable "disk_size_gb" {
  description = "Disk size for GKE nodes in GB"
  type        = number
}

variable "disk_type" {
  description = "Disk type for GKE nodes"
  type        = string
}

variable "initial_node_count" {
  description = "Initial node count for the default node pool"
  type        = number
  default     = 1
}

variable "autoscaling_min_nodes" {
  description = "Minimum nodes for node pool autoscaling"
  type        = number
  default     = 3
}

variable "autoscaling_max_nodes" {
  description = "Maximum nodes for node pool autoscaling"
  type        = number
  default     = 10
}

variable "node_labels" {
  description = "Optional labels for GKE nodes"
  type        = map(string)
  default     = {}
}

variable "node_tags" {
  description = "Optional tags for GKE nodes (module will also add 'gke-nodes')"
  type        = list(string)
  default     = []
}

variable "enable_network_policy" {
  description = "Enable network policy"
  type        = bool
  default     = true
}

variable "logging_service" {
  type    = string
  default = "logging.googleapis.com/kubernetes"
}

variable "monitoring_service" {
  type    = string
  default = "monitoring.googleapis.com/kubernetes"
}

variable "master_ipv4_cidr_block" {
  description = "Master IPv4 CIDR block for private GKE cluster"
  type        = string
  default     = "172.16.0.0/28"
}

variable "nodepool_name" {
  description = "Name of the default node pool"
  type        = string
  default     = "default-nodepool"
}
