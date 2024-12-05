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

  security_groups = ["allow_http"]


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

resource "openstack_networking_secgroup_v2" "allow_http" {
  name                 = var.name
  description          = "Allow http inbound traffic to ${var.name}"
  delete_default_rules = true
}

resource "openstack_networking_secgroup_rule_v2" "allow_http_egress" {
  direction         = "egress"
  ethertype         = "IPv4"
  port_range_min    = 0
  port_range_max    = 0
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.allow_http.id
}

resource "openstack_networking_secgroup_rule_v2" "allow_http_ingress" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 80
  port_range_max    = 80
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.allow_http.id
}
