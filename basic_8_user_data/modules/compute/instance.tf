data "openstack_images_image_v2" "ubuntu" {
  name        = "Ubuntu 24.04 GuestAgent"
  most_recent = true

  properties = {
    key = "value"
  }
}

resource "openstack_blockstorage_volume_v3" "basic_module" {
  size     = 10
  name     = var.name
  image_id = data.openstack_images_image_v2.ubuntu.id
}

resource "openstack_compute_instance_v2" "basic_module" {
  name      = var.name
  flavor_id = var.flavour_id

  key_pair = "mwe"

  security_groups = var.security_groups

  user_data = <<EOF
#!/bin/bash
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
  apt update -y
  apt install -y apache2
  apt install -y mysql-server
  apt install -y php php-mysql libapache2-mod-php php-cli
  ufw allow in "Apache Full"
  chown -R ubuntu /var/www/html/
  systemctl enable apache2
  systemctl start apache2
  echo "Hello from <?php echo gethostname(); ?>" > /var/www/html/index.php
EOF


  metadata = {
    Name = "Hello World"
  }

  network {
    name = "Public1"
  }

  block_device {
    uuid                  = openstack_blockstorage_volume_v3.basic_module.id
    source_type           = "volume"
    destination_type      = "volume"
    delete_on_termination = true
  }
}

