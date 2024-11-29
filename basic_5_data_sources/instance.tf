data "openstack_images_image_v2" "ubuntu" {
  name        = "Ubuntu 24.04"
  most_recent = true

  properties = {
    key = "value"
  }
}

resource "openstack_compute_instance_v2" "basic_5" {
  name            = "basic_5"
  flavor_id       = "6bec5005-f3ed-4ea2-bd4a-57c3dffd1a56"

  metadata = {
    Name = "Hello World"
  }

  network {
    name = "Public1"
  }

  block_device {
    uuid                  = data.openstack_images_image_v2.ubuntu.id
    source_type           = "image"
    volume_size           = 10
    destination_type      = "volume"
    delete_on_termination = true
  }
}
