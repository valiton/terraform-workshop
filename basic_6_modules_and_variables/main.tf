module "instance_one" {
  source = "./modules/compute"

  name        = "basic_module_1"
  image_name  = "Ubuntu 24.04"
  flavor_name = "BWS-C1-1-2"
}

module "instance_two" {
  source = "./modules/compute"

  name        = "basic_module_2"
  image_name  = "Rocky 9"
  flavor_name = "BWS-T1-2-4"
}
