# terraform_ec2_eni

Terraform module to create network interface for EC2 instance. 

This module is not normally needed, but in case you need fixed MAC address might be helpful.

## Dependencies

VPC SUBNET <https://github.com/virsas/terraform_vpc_subnet>
VPC SG <https://github.com/virsas/terraform_vpc_sg>

## Terraform example

``` terraform
##################
# Lambda variables
##################
variable "server1" { 
  default = { 
    name = "workstation1"
    private_ip = "10.0.1.10"
    # you could use the same variable for EC2 instance too
    # see github.com/virsas/terraform_ec2_instance
  } 
}

##################
# Lambda module
##################
module "interface_for_server1" {
  source          = "github.com/virsas/terraform_ec2_eni"
  instance        = var.server1
  # list of security groups
  security_groups = [ module.vpc_sg_admin.id, module.vpc_sg_api.id ]
  # VPC subnet membership. Must be the very same block as the IP configuration of the private_ip
  subnet          = module.vpc_subnet_api_a.id
}
```
