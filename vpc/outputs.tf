output "db_subnet_group_name" {
  value = aws_db_subnet_group.subnet_group.name
}
output "private_subnet_ids" {
  description = "IDs of all private subnets"
  value       = { for key, subnet in aws_subnet.private : key => subnet.id }
}

output "public_subnet_ids" {
  description = "IDs of all public subnets"
  value       = { for key, subnet in aws_subnet.public : key => subnet.id }
}

output "private_subnet_list" {
  description = "List of IDs of all private subnets"
  value       = [ for key, subnet in aws_subnet.private : subnet.id ]
}

output "public_subnet_list" {
  description = "List of IDs of all public subnets"
  value       = [ for key, subnet in aws_subnet.public : subnet.id ]
}

output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}