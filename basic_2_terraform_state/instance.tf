resource "openstack_compute_instance_v2" "basic_2" {
  name            = "basic_2"
  flavor_id       = "6bec5005-f3ed-4ea2-bd4a-57c3dffd1a56"

  metadata = {
    Name = "Hello World"
  }

  network {
    name = "Public1"
  }

  block_device {
    uuid                  = "11cfeaed-62a6-4a2c-8840-1e400f8cd772"
    source_type           = "image"
    volume_size           = 10
    destination_type      = "volume"
    delete_on_termination = true
  }
}
