output "vpc" {
  value = "${module.vpc.vpc_id}"
}

output "subnets" {
  value = "${module.vpc.subnet_ids}"
}