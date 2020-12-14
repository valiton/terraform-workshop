provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "bar" {
  ami           = "ami-0c115dbd34c69a004"
  instance_type = "t3.micro"

  tags = {
    Name = "foo"
  }
}