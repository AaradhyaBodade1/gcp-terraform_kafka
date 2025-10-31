variable "project_id" {
  description = "GCP project id (optional)"
  type        = string
  default     = ""
}

variable "network" {
  description = "Self link or name of the VPC network"
  type        = string
}

variable "firewall_name" {
  description = "Base name for firewall rules"
  type        = string
}

variable "local_ip" {
  description = "List of source IP ranges allowed to access public bastion (SSH)"
  type        = list(string)
}

# kept for backward compatibility with previous module usage (not required by new rules)
variable "target_tags" {
  description = "Optional target tags (legacy)"
  type        = list(string)
  default     = ["allow-ssh"]
}
