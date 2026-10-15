output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}
output "private_subnet_list" {
  value = module.vpc.private_subnet_list
}

output "public_subnet_list" {
  value = module.vpc.public_subnet_list
}

output "vpc_id" {
  value = module.vpc.vpc_id
}
output "bastion_public_ip" {
  value = module.ec2.bastion_public_ip
}