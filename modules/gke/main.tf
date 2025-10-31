resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region

  network    = var.vpc_self_link
  subnetwork = var.subnet_self_link

  remove_default_node_pool = false
  deletion_protection      = false

  logging_service    = var.logging_service
  monitoring_service = var.monitoring_service

  network_policy {
    enabled = var.enable_network_policy
  }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false
    master_ipv4_cidr_block  = var.master_ipv4_cidr_block
  }

  node_pool {
    name               = var.nodepool_name
    initial_node_count = var.initial_node_count

    autoscaling {
      min_node_count = var.autoscaling_min_nodes
      max_node_count = var.autoscaling_max_nodes
    }

    node_config {
      machine_type = var.machine_type
      disk_size_gb = var.disk_size_gb
      disk_type    = var.disk_type
      labels       = var.node_labels
      tags         = concat(var.node_tags, ["gke-nodes"])
      oauth_scopes = ["https://www.googleapis.com/auth/cloud-platform"]
    }
  }
}

