variable "api_instance_count" {
  default = 5
}

module "api" {
  source = "/home/ubuntu/terraform/dc/modules/api"
  environment = "${var.environment}" 
  vpc_id = "${module.vpc.vpc_id}"
  public_subnet_ids = "${module.vpc.public_subnet_ids}" 
  private_subnet_ids = "${module.vpc.private_subnet_ids}"
  api_instance_count = "${var.api_instance_count}"
  region = "${var.region}"
  key_name = "${var.key_name}" 
} 
output "api_elb_address" {
  value = "${module.api.api_elb_address}" }

output "api_host_addresses" {
  value = ["${module.api.api_host_addresses}"]}

