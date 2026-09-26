# ============================================================
# Cloudflare Tunnel Token
# ============================================================

data "aws_ssm_parameter" "monitoring_tunnel_token" {
  name            = "/devops-bootcamp-2026/tunnel-token"
  with_decryption = true
}


# ============================================================
# Web Server
# ============================================================

module "public_server" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 6.0"

  name                  = "web-server"
  create_security_group = false

  ami                         = "ami-0ed6a65b84536f6ce"
  instance_type               = "t3.micro"
  key_name                    = "azrol-key"
  iam_instance_profile        = "EC2-SSM-ROLE"
  subnet_id                   = module.vpc.public_subnets[0]
  private_ip                  = "10.0.0.5"
  vpc_security_group_ids      = [module.public_sg.id]
  associate_public_ip_address = true

  root_block_device = {
    volume_size = 16
    volume_type = "gp3"
  }

  metadata_options = {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
    instance_metadata_tags      = "enabled"
  }

  tags = {
    Name = "web-server"
  }
}


# ============================================================
# Elastic IP - Web Server
# ============================================================

resource "aws_eip" "web" {
  domain   = "vpc"
  instance = module.public_server.id

  tags = {
    Name = "web-server-eip"
  }
}


# ============================================================
# Ansible Controller
# ============================================================

module "controller" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 6.0"

  name                  = "ansible-controller"
  create_security_group = false

  ami                  = "ami-0ed6a65b84536f6ce"
  instance_type        = "t3.micro"
  key_name             = "azrol-key"
  iam_instance_profile = "EC2-SSM-ROLE"

  subnet_id  = module.vpc.private_subnets[0]
  private_ip = "10.0.0.135"

  vpc_security_group_ids = [
    module.private_sg.id
  ]

  root_block_device = {
    volume_size = 16
    volume_type = "gp3"
  }

  metadata_options = {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
    instance_metadata_tags      = "enabled"
  }

  tags = {
    Name = "ansible-controller"
  }
}


# ============================================================
# Monitoring Server
# Prometheus + Grafana + Cloudflare Tunnel
# ============================================================

module "monitoring" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 6.0"

  name                  = "monitoring-server"
  create_security_group = false

  ami                  = "ami-0ed6a65b84536f6ce"
  instance_type        = "t3.micro"
  key_name             = "azrol-key"
  iam_instance_profile = "EC2-SSM-ROLE"

  # ----------------------------------------------------------
  # Cloudflare Tunnel Auto Bootstrap
  # ----------------------------------------------------------

  user_data = templatefile(
    "${path.module}/../userdata-monitoring-tunnel.sh",
    {
      tunnel_token = data.aws_ssm_parameter.monitoring_tunnel_token.value
    }
  )

  subnet_id  = module.vpc.private_subnets[0]
  private_ip = "10.0.0.136"

  vpc_security_group_ids = [
    module.private_sg.id
  ]

  root_block_device = {
    volume_size = 16
    volume_type = "gp3"
  }

  metadata_options = {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
    instance_metadata_tags      = "enabled"
  }

  tags = {
    Name = "monitoring-server"
  }
}
