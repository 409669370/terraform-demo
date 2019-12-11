variable "availability_zone_names" {
  type = string
  default = "cn-qingdao-c"
}

variable "region" {
  type = string
  default = "cn-qingdao"
}

variable "img_id" {
  type = string
  default = "ubuntu_18_04_64_20G_alibase_20190509.vhd"
}

variable "instance_type" {
  type = string
  default = "ecs.e4.small"
}

variable "public_key" {
  type = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDDRelVOErDdAhUF76uuKRH1Po8fPEBFUO6bCpBR6KCcLgweHYSSzGOTCpCfynoAikhqnP8hVabJqza6XKBofHt+HdoBlRHB+5On+Qv01Spm7WB2kvbET7Ce23eBebspjcAeZKvLayDdX3udA6gRO+kvpVtddydbUIgWfRQVRws7Uaj2mcgdS9o4nObdzm11zxs6DMhmHXl7twKpndS5gkCpZZvAje6e/JBweNgas9bkme3JeiYsmJ2yvPMl6AQRZL9eIjBi7ErBVgLopUiAUEvQYXAKkeTZlpEVTFGng+NOeNR5FMpU1impdLlbWAXC8R6QJIt3QG3qL0P0BeLSnON"
}

variable "cidr_block" {
  type = string
  default = "10.10.10.0/24"
}
