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
  port_range_min    = var.from_port
  port_range_max    = var.to_port
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.allow_http.id
}
