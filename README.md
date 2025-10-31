# gcp-terraform_kafka
Terraform Project Overview

This repository contains a modularized Terraform project designed to provision and manage Google Cloud infrastructure components efficiently. The structure follows best practices for reusable and maintainable infrastructure-as-code.

 Project Structure
terraform-project/
├── modules/
│   ├── firewall/       # Module for configuring firewall rules and network security policies
│   ├── gke/            # Module for provisioning Google Kubernetes Engine (GKE) clusters
│   ├── vm/             # Module for creating and managing virtual machine instances
│   └── vpc/            # Module for setting up Virtual Private Cloud networks and subnets
│
├── main.tf             # Root Terraform configuration file; integrates and calls the modules
├── outputs.tf          # Defines output variables to display after deployment
├── providers.tf        # Configures required Terraform providers (e.g., Google)
├── terraform.tfvars    # Contains variable values used by Terraform during execution
├── variables.tf        # Declares all input variables used across the project
└── README.md           # Project documentation and usage guide

 How It Works

Each module encapsulates a specific infrastructure component (e.g., vpc, vm, gke, firewall), allowing easy reuse and scalability.

The root configuration files (main.tf, providers.tf, variables.tf, and outputs.tf) define global settings and orchestrate the module deployments.

All sensitive and environment-specific values (like project IDs, region, and credentials) are stored in terraform.tfvars.
