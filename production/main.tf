provider "aws" {
  region = "${var.region}"
}

module "remote_state" {
  source = "github.com/turnbullpress/tf_remote_state.git"
  prefix = "${var.prefix}"
  environment = "${var.environment}"
}

module "vpc" {
  source = "github.com/turnbullpress/tf_vpc.git?ref=v0.0.2"
  environment = "{var.environment}"
  region = "${var.region}"
  key_name = "${var.key_name}"
  vpc_cidr = "${var.vpc_cidr}"
  public_subnets = ["${var.public_subnets}"]
  private_subnets = ["${var.private_subnets}"]
}

output "public_subnet_ids" {
  value = ["${module.vpc.public_subnet_ids}"]
}

output "private_subnet_ids" {
  value = ["${module.vpc.private_subnet_ids}"]
}

output "bastion_host_dns" {
  value = "${module.vpc.bastion_host_dns}"
}

output "bastion_host_ip" {
  value = "${module.vpc.bastion_host_ip}"
}
