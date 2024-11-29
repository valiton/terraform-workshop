module "instance_one" {
  source = "./modules/compute"

  name       = "basic_module_1"
  image_name = "Ubuntu 24.04"
  flavour_id = "6bec5005-f3ed-4ea2-bd4a-57c3dffd1a56" #BWS-T1-2-2
}

module "instance_two" {
  source = "./modules/compute"

  name       = "basic_module_2"
  image_name = "Rocky 9"
  flavour_id = "56f8553a-49ac-4b26-9043-98d80444fbf6" #BWS-T1-2-4
}
