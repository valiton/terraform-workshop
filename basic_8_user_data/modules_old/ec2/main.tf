resource "aws_instance" "foo" {
  ami             = data.aws_ami.amazon_ecs_optimized.id
  instance_type   = var.instance_type
  security_groups = var.security_groups
  user_data       = <<EOF
#!/bin/bash
yum update -y
amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2
yum install -y httpd mariadb-server
systemctl start httpd
systemctl enable httpd
usermod -a -G apache ec2-user
chown -R ec2-user:apache /var/www
chmod 2775 /var/www
find /var/www -type d -exec chmod 2775 {} \;
find /var/www -type f -exec chmod 0664 {} \;​
echo "Hello from <?php echo gethostname(); ?>" > /var/www/html/index.php
EOF

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
