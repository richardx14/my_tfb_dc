variable "region" {
  description = "AWS region"
}

variable "prefix" {
  descriptopn = "name of our org"
}

variable "environment" {
  description = "env"
}

variable "key_name" {
  description = "aws key pair for resources"
}

variable "vpc_cidr" {
  description = "cidr of the vpc"
}

variable "public_subnets" {
  description = "public subnet list to populate"
}

variable "private_subnets" {
  description = "private subnet list to populate"
}

