provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "foo" {
  ami             = data.aws_ami.amazon_ecs_optimized.id
  instance_type   = var.instance_type
  security_groups = [aws_security_group.allow_http.name]

  tags = {
    Name = var.name
  }
}

resource "aws_eip" "ip" {
  instance = aws_instance.foo.id
  vpc      = true
}

resource "aws_security_group" "allow_http" {
  name        = var.name
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

data "aws_ami" "amazon_ecs_optimized" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-ecs*"]
  }
}
