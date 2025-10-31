resource "google_compute_network" "vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
  description             = var.vpc_description
}

# Public Subnet
resource "google_compute_subnetwork" "public_subnet" {
  name                     = "${var.vpc_name}-public-subnet"
  ip_cidr_range            = var.public_subnet_cidr
  region                   = var.region
  network                  = google_compute_network.vpc.id
  description              = "Public subnet for bastion"
  private_ip_google_access = true
}

# Private Subnet
resource "google_compute_subnetwork" "private_subnet" {
  name                     = "${var.vpc_name}-private-subnet"
  ip_cidr_range            = var.private_subnet_cidr
  region                   = var.region
  network                  = google_compute_network.vpc.id
  description              = "Private subnet for GKE"
  private_ip_google_access = true
}
