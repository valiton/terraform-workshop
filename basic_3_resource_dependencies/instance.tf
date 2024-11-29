resource "openstack_blockstorage_volume_v3" "basic_3" {
  size     = 10
  name     = "basic_3"
  image_id = "11cfeaed-62a6-4a2c-8840-1e400f8cd772"
}

resource "openstack_compute_instance_v2" "basic_3" {
  name            = "basic_3"
  flavor_id       = "6bec5005-f3ed-4ea2-bd4a-57c3dffd1a56"

  metadata = {
    Name = "Hello World"
  }

  network {
    name = "Public1"
  }

  block_device {
    uuid                  = openstack_blockstorage_volume_v3.basic_3.id
    source_type           = "volume"
    destination_type      = "volume"
    delete_on_termination = true
  }
}

