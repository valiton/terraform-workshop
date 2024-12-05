resource "openstack_compute_instance_v2" "basic_1" {
  name        = "basic_1"
  flavor_name = "BWS-C1-1-2"

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
