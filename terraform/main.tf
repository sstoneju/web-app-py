locals {
  profile = "testkey"
  app_name = "web-app"
  vpc_name = "eks-vpc"
  region = "ap-northeast-2"
  vpc_cidr = "10.0.0.0/16"
  azs      = slice(data.aws_availability_zones.available.names, 0, 3)
}

terraform {
  required_version = ">= 1.1.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.47"
    }
    kubernetes = {
      version = "2.10.0"
    }
  }

  backend "s3" {
      bucket = "tyler-tf-state-file"
      key = "backend/test.tfstate"
      region = "ap-northeast-2"
      profile = "testkey"
      encrypt = true
  }
}

provider "aws" {
  profile = "testkey"
  region = var.aws_region

  default_tags {
    tags = {
      Environment = var.environment
      Terraform = "True"
    }
  }
}

# provider "kubernetes" {
#   host = module.eks_bottlerocket.cluster_endpoint
#   cluster_ca_certificate = base64decode(module.eks_bottlerocket.cluster_certificate_authority_data)

#   exec {
#     api_version = "client.authentication.k8s.io/v1alpha1"
#     command     = "aws"
#     # This requires the awscli to be installed locally where Terraform is executed
#     args = ["eks", "get-token", "--cluster-name", module.eks_bottlerocket.cluster_id]
#   }
# }

module "tags" {
  source  = "clowdhaus/tags/aws"
  version = "~> 1.0"

  application = local.app_name
  environment = "nonprod"
  repository  = "https://github.com/clowdhaus/eks-reference-architecture"
}