module "instance_one" {
  source = "./modules/compute"

  name            = "basic_module_8_1"
  flavor_name     = "BWS-C1-1-2"
  security_groups = [module.http_security_group.security_group_name, module.ssh_security_group.security_group_name]
}

module "instance_two" {
  source = "./modules/compute"

  name            = "basic_module_8_2"
  flavor_name     = "BWS-T1-2-4"
  security_groups = [module.http_security_group.security_group_name, module.ssh_security_group.security_group_name]
}

module "http_security_group" {
  source = "./modules/security_group"

  name      = "http_access"
  from_port = 80
  to_port   = 80
}

module "ssh_security_group" {
  source = "./modules/security_group"

  name      = "ssl_access"
  from_port = 22
  to_port   = 22
}
