
output "vpc_self_link" {
  value       = google_compute_network.vpc.self_link
  description = "Self link of the VPC"
}

output "public_subnet_self_link" {
  value       = google_compute_subnetwork.public_subnet.self_link
  description = "Self link of the Public Subnet"
}

output "private_subnet_self_link" {
  value       = google_compute_subnetwork.private_subnet.self_link
  description = "Self link of the Private Subnet"
}
