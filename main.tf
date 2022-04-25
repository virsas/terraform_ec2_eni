provider "aws" {
  region = var.region
}

resource "aws_network_interface" "interface" {
  subnet_id   = var.subnet
  private_ips = [var.instance.private_ip]
  security_groups = var.security_groups

  tags = {
    Name = var.instance.name
  }
}