provider "aws" {
  region = "eu-central-1"
}

module "my_instances" {
  source = "./modules/ec2"

  names           = ["Instance-1", "Instance-2"]
  instance_type   = "t3.micro"
  security_groups = [module.http_security_group.security_group_name]
}

module "http_security_group" {
  source = "./modules/security_group"

  name      = "http_access"
  from_port = 80
  to_port   = 80
}
