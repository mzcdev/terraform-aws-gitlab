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

variable "public_subnet_ids" {
  default = []
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

variable "volume_id" {
  default = ""
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

variable "domain" {
  default = ""
}

variable "base_domain" {
  default = ""
}

variable "slack_token" {
  default = ""
}
