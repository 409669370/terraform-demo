provider "alicloud" {
}

resource "alicloud_vpc" "main" {
  cidr_block = var.cidr_block
}

resource "alicloud_security_group" "main" {
  name        = "default"
  description = "default"
  vpc_id      = alicloud_vpc.main.id
}

resource "alicloud_security_group_rule" "allow_in" {
  security_group_id = alicloud_security_group.main.id
  type              = "ingress"
  cidr_ip           = "0.0.0.0/0"
  policy            = "accept"
  ip_protocol       = "all"
  nic_type          = "intranet"
  port_range        = "-1/-1"
  priority          = 1
}

resource "alicloud_security_group_rule" "allow_out" {
  security_group_id = alicloud_security_group.main.id
  type              = "egress"
  cidr_ip           = "0.0.0.0/0"
  policy            = "accept"
  ip_protocol       = "all"
  nic_type          = "intranet"
  port_range        = "-1/-1"
  priority          = 1
}

resource "alicloud_vswitch" "main" {
  vpc_id            = alicloud_vpc.main.id
  cidr_block        = var.cidr_block
  availability_zone = var.availability_zone_names
}

resource "alicloud_eip" "eip" {
  count = 1
}

resource "alicloud_eip_association" "attach" {
  count         = 1
  allocation_id = element(alicloud_eip.eip.*.id, count.index)
  instance_id   = alicloud_instance.web_server.id
}

resource "alicloud_key_pair" "public_key" {
  public_key = var.public_key
}

resource "alicloud_instance" "web_server" {
  image_id             = var.img_id
  instance_type        = var.instance_type
  instance_charge_type = "PostPaid"
  internet_charge_type = "PayByTraffic"
  system_disk_category = "cloud_efficiency"
  instance_name        = "web-server"
  security_groups = [
  alicloud_security_group.main.id]
  vswitch_id = alicloud_vswitch.main.id
  key_name   = alicloud_key_pair.public_key.id
}