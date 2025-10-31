variable "vm_name" {
  description = "VM instance name"
  type        = string
}

variable "machine_type" {
  description = "Machine type for the VM instance (module expects 'machine_type')"
  type        = string
}

variable "disk_size_gb" {
  description = "Disk size for the VM instance in GB"
  type        = number
}

variable "zone" {
  description = "GCP zone"
  type        = string
}

variable "subnet_selflink" {
  description = "Self link of the subnet where VM should be created"
  type        = string
}

variable "service_account_email" {
  description = "Service account email for the VM"
  type        = string
}

variable "image" {
  description = "Boot disk image"
  type        = string
  default     = "ubuntu-os-cloud/ubuntu-2204-lts"
}

variable "tags" {
  description = "Network tags to attach to the VM (module will also add 'bastion')"
  type        = list(string)
  default     = ["allow-ssh"]
}
