output "vpc" {
  value = "${module.vpc.vpc_id}"
}

output "subnets" {
  value = "${module.vpc.subnet_ids}"
}

output "private_subnets" {
  value = "${module.vpc.private_subnet_ids}"
}