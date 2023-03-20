# resource "aws_instance" "web" {
#   ami           = "ami-0e735aba742568824"
#   instance_type = "t3.micro"

#   tags = {
#     Name = "HelloWorld"
#   }
# }

module "eks_bottlerocket" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.10.0"

  cluster_name    = "${local.app_name}-br"
  cluster_version = "1.24"

  # EKS Addons
  cluster_addons = {
    coredns    = {}
    kube-proxy = {}
    vpc-cni    = {}
  }

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  eks_managed_node_groups = {
    bottlerocket = {
      ami_type = "BOTTLEROCKET_x86_64"
      platform = "bottlerocket"

      instance_types = ["t3.medium"]
      capacity_type  = "SPOT"

      min_size     = 1
      max_size     = 2
      desired_size = 1
    }
  }

  tags = module.tags.tags
}