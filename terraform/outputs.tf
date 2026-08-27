output "vpc_id" {
  description = "ID of the Final Project VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = module.vpc.public_subnets[0]
}

output "private_subnet_id" {
  description = "ID of the private subnet"
  value       = module.vpc.private_subnets[0]
}

output "nat_gateway_id" {
  description = "ID of the NAT Gateway"
  value       = module.vpc.natgw_ids[0]
}
