variable "region" {
  description = "AWS region"
}

variable "prefix" {
  description = "prefix"
}

variable "environment" {
  description = "environment"
}

variable "key_name" {
  description = "aws key pair"
}

variable "vpc_cidr" {
  description = "vpc_cidr"
}

variable "public_subnets" {
  default = []
  description = "public subnets to populate"
}

variable "private_subnets" {
  default = []
  description = "private subnets to populate"
}

