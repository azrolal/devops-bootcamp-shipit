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

output "web_server_private_ip" {
  description = "Private IP address of the web server"
  value       = module.public_server.private_ip
}

output "web_server_public_ip" {
  description = "Public Elastic IP address of the web server"
  value       = aws_eip.web.public_ip
}

output "controller_private_ip" {
  description = "Private IP address of the Ansible controller"
  value       = module.controller.private_ip
}

output "monitoring_private_ip" {
  description = "Private IP address of the monitoring server"
  value       = module.monitoring.private_ip
}
