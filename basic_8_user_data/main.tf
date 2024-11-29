module "instance_one" {
  source = "./modules/compute"

  name            = "basic_module_8_1"
  flavour_id      = "6bec5005-f3ed-4ea2-bd4a-57c3dffd1a56" #BWS-T1-2-2
  security_groups = [module.http_security_group.security_group_name, module.ssh_security_group.security_group_name]
}

module "instance_two" {
  source = "./modules/compute"

  name            = "basic_module_8_2"
  flavour_id      = "56f8553a-49ac-4b26-9043-98d80444fbf6" #BWS-T1-2-4
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
