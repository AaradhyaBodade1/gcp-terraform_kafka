# gcp-terraform_kafka
Terraform Project Overview

This repository contains a modularized Terraform project designed to provision and manage Google Cloud infrastructure components efficiently. The structure follows best practices for reusable and maintainable infrastructure-as-code.

How It Works

Each module encapsulates a specific infrastructure component (e.g., vpc, vm, gke, firewall), allowing easy reuse and scalability.

The root configuration files (main.tf, providers.tf, variables.tf, and outputs.tf) define global settings and orchestrate the module deployments.

All sensitive and environment-specific values (like project IDs, region, and credentials) are stored in terraform.tfvars.
