# variable

variable "name" {
  description = "Name of the cluster, e.g: demo"
}

variable "vpc_id" {
  default = ""
}

variable "subnet_id" {
  default = ""
}

variable "gitlab_version" {
  default = "12"
}

variable "allow_ip_address" {
  type    = list(string)
  default = []
}

variable "ami_id" {
  default = ""
}

variable "instance_type" {
  default = "t2.medium"
}

variable "volume_type" {
  default = "gp2"
}

variable "volume_size" {
  default = "64"
}

variable "key_name" {
  default = ""
}

variable "key_path" {
  default = ""
}

variable "user_data" {
  default = ""
}
