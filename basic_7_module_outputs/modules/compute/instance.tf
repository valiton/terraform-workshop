data "openstack_images_image_v2" "ubuntu" {
  name        = var.image_name
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
  name        = var.name
  flavor_name = var.flavor_name

  security_groups = var.security_groups


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

