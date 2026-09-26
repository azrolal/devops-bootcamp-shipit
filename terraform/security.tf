module "public_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 6.0"

  name            = "devops-public-sg"
  use_name_prefix = false
  description     = "Security group for public web server"
  vpc_id          = module.vpc.vpc_id

  ingress_rules = {
    http = {
      from_port   = 80
      to_port     = 80
      ip_protocol = "tcp"
      cidr_ipv4   = "0.0.0.0/0"
      description = "Allow HTTP from Internet"
    }

    ssh = {
      from_port   = 22
      to_port     = 22
      ip_protocol = "tcp"
      cidr_ipv4   = module.vpc.vpc_cidr_block
      description = "Allow SSH from VPC"
    }

    node_exporter = {
      from_port   = 9100
      to_port     = 9100
      ip_protocol = "tcp"
      cidr_ipv4   = "10.0.0.136/32"
      description = "Allow Node Exporter from Monitoring Server only"
    }
  }

  egress_rules = {
    all = {
      ip_protocol = "-1"
      cidr_ipv4   = "0.0.0.0/0"
      description = "Allow all outbound traffic"
    }
  }

  tags = {
    Name = "devops-public-sg"
  }
}

module "private_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 6.0"

  name            = "devops-private-sg"
  use_name_prefix = false
  description     = "Security group for private servers"
  vpc_id          = module.vpc.vpc_id

  ingress_rules = {
    ssh = {
      from_port   = 22
      to_port     = 22
      ip_protocol = "tcp"
      cidr_ipv4   = module.vpc.vpc_cidr_block
      description = "Allow SSH from VPC"
    }
  }

  egress_rules = {
    all = {
      ip_protocol = "-1"
      cidr_ipv4   = "0.0.0.0/0"
      description = "Allow all outbound traffic"
    }
  }

  tags = {
    Name = "devops-private-sg"
  }
}
