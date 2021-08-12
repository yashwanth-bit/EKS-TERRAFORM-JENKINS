provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}

data "aws_eks_cluster" "cluster" {
  name = module.my-cluster.cluster_id
     depends_on = [
    module.vpc.private_route_table_ids,
    module.vpc.public_route_table_ids,
  ]
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.my-cluster.cluster_id
     depends_on = [
    module.vpc.private_route_table_ids,
    module.vpc.public_route_table_ids,
  ]
}
module "my-cluster" {
  source          = "github.com/yashwanth-bit/terraform-aws-eks"
  cluster_name    = "my-cluster"
  cluster_version = "1.21"
  subnets         = ["${module.vpc.public_subnet_1}","${module.vpc.public_subnet_2}","${module.vpc.public_subnet_1}"]
  #subnets = module.vpc.*.public_subnets
  #vpc_id          = "vpc-1234556abcdef"
  vpc_id = "${module.vpc.vpc_id}"

  worker_groups = [
    {
      instance_type = "t2.large"
      asg_desired_capacity = 2
      asg_min_size  = 2
      asg_max_size  = 4
    }
  ]
}
#----------------------------------
# module "eks" {
#   source  = "terraform-aws-modules/eks/aws"
#   cluster_name    = "my-cluster"
#   cluster_version = "1.21"
#   subnets         = module.vpc.public_subnets

#   vpc_id = module.vpc.vpc_id

#   node_groups = {
#     first = {
#       desired_capacity = 2
#       max_capacity     = 10
#       min_capacity     = 1

#       instance_type = "t2.large"
#     }
#   }

#   write_kubeconfig   = true
# }
