variable "cloudflare_email" {}
variable "cloudflare_token" {}
variable "domain" {
  default = "dicecentre.org"
}

variable "web_instance_count" {
  default = 2
}

variable "app_instance_count" {
  default = 2
}

provider "cloudflare" {
  email = "${var.cloudflare_email}"
  token = "${var.cloudflare_token}"
}


module "web" {
  source = "/home/ubuntu/terraform/dc/modules/web"
  environment = "${var.environment}" 
  vpc_id = "${module.vpc.vpc_id}"
  public_subnet_ids = "${module.vpc.public_subnet_ids}" 
  private_subnet_ids = "${module.vpc.private_subnet_ids}"
  web_instance_count = "${var.web_instance_count}"
  app_instance_count = "${var.app_instance_count}"
  domain = "${var.domain}"
  region = "${var.region}"
  key_name = "${var.key_name}" 
} 
output "web_elb_address" {
  value = "${module.web.web_elb_address}" }

output "web_host_addresses" {
  value = [" ${module.web.web_host_addresses}"] }

output "app_host_addresses" {
  value = [" ${module.web.web_host_addresses}"] }

