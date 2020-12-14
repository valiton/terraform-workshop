module "instance_one" {
  source = "./modules/ec2"

  name          = "my-instance-1"
  instance_type = "t3.micro"
}

module "instance_two" {
  source = "./modules/ec2"

  name          = "my-instance-2"
  instance_type = "t3.micro"
}
