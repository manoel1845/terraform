variable "region" {
  default = "sa-east-1"
}

variable "vpc_cidr_block" {
  default = "10.10.10.0/24"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "image_id" {
  default = "ami-03e1e4abf50e14ded"
}