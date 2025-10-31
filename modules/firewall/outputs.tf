output "bastion_firewall_name" {
  value = google_compute_firewall.bastion_ssh.name
}

output "bastion_to_gke_firewall_name" {
  value = google_compute_firewall.bastion_to_gke.name
}