## terraform practice
This is a practice setup of postgres in AWS.
Objectives:
- VPC creation with 1 set of private and public subnet in each AZ.
- POSTGRES DB with read replicas
- Create a bastion to access the DB

Take note that RDS needs a subnet group.

Things that can be learnt:
- Usage of outputs and using them in other modules
- Creation of postgres db aurora
- Basic VPC setup

Improvements:
- Setup ACL for VPC subnets

## Commands
- terraform init -backend-config=backend.tfvars
- terraform plan
- terraform apply



