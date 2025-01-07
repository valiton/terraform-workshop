module "my_instance" {
  source = "./modules/compute"

  names           = ["basic_module_9_1", "basic_module_9_2"]
  flavor_name     = "BWS-C1-1-2"
  security_groups = [module.http_security_group.security_group_name]
}

module "http_security_group" {
  source = "./modules/security_group"

  name      = "http_access"
  from_port = 80
  to_port   = 80
}

