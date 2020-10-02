# alicloud
provider "alicloud" {}

resource "alicloud_instance" "ecs-poc" {
  image_id = "m-uf68h4rkl1g4f3ztdqyp"
  instance_type = "ecs.t5-lc2m1.nano"
  security_groups = ["sg-uf6b0hrl436l477s7tn4"]
  vswitch_id = "vsw-uf6pi8i2qxp15k58jonz6"
  private_ip = "172.19.112.191"
}
