output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_subnets_1" {
  description = "The ID of the VPC"
  value       = module.vpc.public_subnet_1
}

output "public_subnets_2" {
  description = "The ID of the VPC"
  value       = module.vpc.public_subnet_2
}

output "public_subnets_3" {
  description = "The ID of the VPC"
  value       = module.vpc.public_subnet_3
}