terraform {
  backend "s3" {
    bucket         = "<YOUR-BUCKET-NAME>"
    key            = "<PATH/TO/YOUR/STATEFILE>"
    region         = "eu-central-1"
    dynamodb_table = "<YOUR-DYNAMODB_TABLE>"
  }
}

provider "aws" {
  region = "eu-central-1"
}

module "my_instances" {
  source = "./modules/ec2"

  names           = ["Instance-1-${terraform.workspace}", "Instance-2-${terraform.workspace}"]
  instance_type   = "t3.micro"
  security_groups = [module.http_security_group.security_group_name]
}

module "http_security_group" {
  source = "./modules/security_group"

  name      = "http_access-${terraform.workspace}"
  from_port = 80
  to_port   = 80
}

// Can be imported with "terraform import aws_instance.legacy i-1234567890"
resource "aws_instance" "legacy" {
  ami           = "ami-0c115dbd34c69a004" # insert ami of used instance
  instance_type = "t2.micro"

  tags = {
    Name = "LegacyInstance-${terraform.workspace}"
  }
}
