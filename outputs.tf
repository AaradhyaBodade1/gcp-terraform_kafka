output "gke_cluster_name" {
  value       = module.gke.cluster_name
  description = "Name of the GKE cluster"
}

output "gke_endpoint" {
  value       = module.gke.endpoint
  description = "Endpoint of the GKE cluster"
}

