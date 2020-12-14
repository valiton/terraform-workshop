provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "foo" {
  ami             = "ami-0c115dbd34c69a004"
  instance_type   = "t3.micro"
  security_groups = [aws_security_group.allow_http.name]

  tags = {
    Name = "bar"
  }
}

resource "aws_eip" "ip" {
  instance = aws_instance.foo.id
  vpc      = true
}

resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allow http inbound traffic"

  ingress {
    description = "allow http traffic from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}