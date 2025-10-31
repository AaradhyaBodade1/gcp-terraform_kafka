# Provider / Project
variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
}

variable "zone" {
  description = "GCP zone"
  type        = string
}

# VPC / Subnets
variable "vpc_name" {
  description = "Name of the VPC network"
  type        = string
}

variable "vpc_description" {
  description = "VPC description"
  type        = string
  default     = "VPC network for project"
}

variable "public_subnet_cidr" {
  description = "CIDR range for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR range for the private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

# Firewall
variable "firewall_name" {
  description = "Base name for firewall rules"
  type        = string
  default     = "allow-ssh"
}

variable "local_ip" {
  description = "List of source CIDRs allowed to access bastion (SSH)"
  type        = list(string)
}

variable "target_tags" {
  description = "Legacy/compat target tags"
  type        = list(string)
  default     = ["allow-ssh"]
}

# VM (Bastion) inputs: values passed from root to module
variable "vm_name" {
  description = "Bastion VM name"
  type        = string
}

variable "vm_machine_type" {
  description = "Bastion machine type (this is passed to module.machine_type)"
  type        = string
}

variable "vm_disk_size_gb" {
  description = "Bastion disk size in GB"
  type        = number
}

variable "vm_tags" {
  description = "Tags to attach to bastion (module will also add 'bastion')"
  type        = list(string)
  default     = ["allow-ssh"]
}

variable "service_account_email" {
  description = "Service account email for VM"
  type        = string
}

# GKE inputs: values passed from root to module
variable "gke_cluster_name" {
  description = "GKE cluster name"
  type        = string
}

variable "gke_machine_type" {
  description = "GKE node machine type (passed to module.machine_type)"
  type        = string
}

variable "gke_disk_size_gb" {
  description = "GKE node disk size in GB"
  type        = number
}

variable "gke_disk_type" {
  description = "GKE node disk type"
  type        = string
  default     = "pd-standard"
}

variable "initial_node_count" {
  description = "Initial node count for node pool"
  type        = number
  default     = 1
}

variable "gke_autoscaling_min_nodes" {
  description = "GKE autoscaling min nodes"
  type        = number
  default     = 3
}

variable "gke_autoscaling_max_nodes" {
  description = "GKE autoscaling max nodes"
  type        = number
  default     = 10
}

variable "gke_node_labels" {
  description = "Labels for GKE nodes"
  type        = map(string)
  default     = {}
}

variable "gke_node_tags" {
  description = "Tags for GKE nodes (module will also add 'gke-nodes')"
  type        = list(string)
  default     = []
}

variable "gke_enable_network_policy" {
  description = "Enable network policy on cluster"
  type        = bool
  default     = true
}

variable "gke_logging_service" {
  type    = string
  default = "logging.googleapis.com/kubernetes"
}

variable "gke_monitoring_service" {
  type    = string
  default = "monitoring.googleapis.com/kubernetes"
}

variable "gke_master_ipv4_cidr_block" {
  description = "Master IPv4 CIDR block for private GKE cluster"
  type        = string
  default     = "172.16.0.0/28"
}

variable "gke_nodepool_name" {
  description = "GKE node pool name"
  type        = string
  default     = "default-nodepool"
}
