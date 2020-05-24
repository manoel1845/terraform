variable "name" {
  description = "The name for the resource"
  default = "example"
}

variable "environment" {
  description = "The env of the app"
  default = "staging"
}

variable "region" {
  region     = "sa-east-1"
}

variable "access_key" {
  access_key = "AKIAWNXSNZXXSVNHU45H"
}

variable "secret_key" {
  secret_key = "DEj2oY4lGl7liE9kQxEP2DV2uCo+CAar2yqidPSW"
}

variable "vpc_cidr_block" {
  cidr_block       = "10.10.10.0/24"
}
