resource "aws_instance" "foo" {
  ami             = data.aws_ami.amazon_ecs_optimized.id
  instance_type   = var.instance_type
  security_groups = var.security_groups

  tags = {
    Name = var.name
  }
}

resource "aws_eip" "ip" {
  instance = aws_instance.foo.id
  vpc      = true
}

data "aws_ami" "amazon_ecs_optimized" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-ecs*"]
  }
}
