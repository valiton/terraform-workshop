provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "foo" {
  ami           = "ami-0c115dbd34c69a004"
  instance_type = "t3.micro"

  tags = {
    Name = "bar"
  }
}

resource "aws_eip" "ip" {
  instance = aws_instance.foo.id
  vpc      = true
}