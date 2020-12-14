
module "instance_one" {
  source = "./modules/ec2"

  name            = "my-instance-1"
  instance_type   = "t3.micro"
  security_groups = [module.ssh_security_group.security_group_name]
}

module "instance_two" {
  source = "./modules/ec2"

  name            = "my-instance-2"
  instance_type   = "t3.micro"
  security_groups = [module.ssh_security_group.security_group_name]
}

module "ssh_security_group" {
  source = "./modules/security_group"

  name      = "internal_access"
  from_port = 22
  to_port   = 22
}