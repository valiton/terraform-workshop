output "security_group_name" {
  value = openstack_networking_secgroup_v2.allow_http.name
}
