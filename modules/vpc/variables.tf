variable "project_id" { type = string }
variable "region" { type = string }

variable "vpc_name" { type = string }
variable "vpc_description" {
  type    = string
  default = "VPC network for project"
}

variable "public_subnet_cidr" { type = string }
variable "private_subnet_cidr" { type = string }
