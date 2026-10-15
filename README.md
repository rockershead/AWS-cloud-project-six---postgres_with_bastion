## terraform practice
This is a practice setup of postgres in AWS.
Objectives:
- VPC creation with 1 set of private and public subnet in each AZ.
- POSTGRES DB with read replicas
- Create a bastion to access the DB

Take note that RDS needs a subnet group.


## Commands
- terraform init -backend-config=backend.tfvars
- terraform plan
- terraform apply



