module "vpc" {
  source             = "./modules/vpc"
  project_id         = var.project_id
  region             = var.region
  vpc_name           = var.vpc_name
  public_subnet_cidr = var.public_subnet_cidr
  private_subnet_cidr= var.private_subnet_cidr
}

module "firewall" {
  source        = "./modules/firewall"
  project_id    = var.project_id
  network       = module.vpc.vpc_self_link
  firewall_name = var.firewall_name
  local_ip      = var.local_ip
}

module "vm" {
  source                = "./modules/vm"
  vm_name               = var.vm_name
  machine_type          = var.vm_machine_type
  disk_size_gb          = var.vm_disk_size_gb
  zone                  = var.zone
  subnet_selflink       = module.vpc.public_subnet_self_link
  tags                  = var.vm_tags
  service_account_email = var.service_account_email
}

module "gke" {
  source                 = "./modules/gke"
  cluster_name           = var.gke_cluster_name
  region                 = var.region
  vpc_self_link          = module.vpc.vpc_self_link
  subnet_self_link       = module.vpc.private_subnet_self_link
  machine_type           = var.gke_machine_type
  disk_size_gb           = var.gke_disk_size_gb
  disk_type              = var.gke_disk_type
  initial_node_count     = var.initial_node_count
  autoscaling_min_nodes  = var.gke_autoscaling_min_nodes
  autoscaling_max_nodes  = var.gke_autoscaling_max_nodes
  node_labels            = var.gke_node_labels
  node_tags              = var.gke_node_tags
  enable_network_policy  = var.gke_enable_network_policy
  logging_service        = var.gke_logging_service
  monitoring_service     = var.gke_monitoring_service
  master_ipv4_cidr_block = var.gke_master_ipv4_cidr_block
  nodepool_name          = var.gke_nodepool_name
}
