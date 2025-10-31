project_id = "......."
region     = "europe-west1"
zone       = "europe-west1-b"

vpc_name               = "kafka---vpc"
public_subnet_cidr     = "10.0.1.0/24"
private_subnet_cidr    = "10.0.2.0/24"
vpc_description        = "kafka - vpc"

firewall_name = "allow-ssh"
local_ip = [
  "14.141.28.114/32",     
  "182.76.226.218/32",
  "157.119.213.251/32",
  
]
target_tags = ["allow-ssh"]

vm_name               = "kafka---vm"
vm_machine_type       = "e2-standard-4"
vm_disk_size_gb       = 20
vm_tags               = ["allow-ssh"]
service_account_email = ".."

gke_cluster_name           = "kafka---gke-cluster"
gke_machine_type           = "e2-standard-2"
gke_disk_size_gb           = 40
gke_disk_type              = "pd-standard"
initial_node_count         = 1
gke_autoscaling_min_nodes  = 2
gke_autoscaling_max_nodes  = 20
gke_node_labels            = {}
gke_node_tags              = []
gke_enable_network_policy  = true
gke_logging_service        = "logging.googleapis.com/kubernetes"
gke_monitoring_service     = "monitoring.googleapis.com/kubernetes"
gke_master_ipv4_cidr_block = "172.16.0.0/28"
gke_nodepool_name          = "kafka---nodepool"
