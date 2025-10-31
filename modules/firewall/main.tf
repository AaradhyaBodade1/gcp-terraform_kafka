# SSH Access to Bastion (Public Subnet)
resource "google_compute_firewall" "bastion_ssh" {
  name    = "${var.firewall_name}-bastion-ssh"
  network = var.network

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = var.local_ip
  target_tags   = ["bastion"]
}

# Bastion → GKE nodes (Private Subnet)
resource "google_compute_firewall" "bastion_to_gke" {
  name    = "${var.firewall_name}-bastion-to-gke"
  network = var.network

  allow {
    protocol = "tcp"
    ports    = ["22","443"]
  }

  source_ranges = ["10.0.1.0/24"]  # Public subnet
  target_tags   = ["gke-nodes"]
}

# -------------------------------
# Cloud NAT for private subnet
# -------------------------------
resource "google_compute_router" "nat_router" {
  name    = "kafka-uat-nat-router"
  network = var.network
}

resource "google_compute_router_nat" "nat" {
  name                               = "kafka-uat-nat"
  router                             = google_compute_router.nat_router.name
  nat_ip_allocate_option              = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat  = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}
