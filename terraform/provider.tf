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

terraform {
  required_version = ">= 1.1.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.8.0"
    }
    kubernetes = {
      version = "2.10.0"
    }
  }

  backend "s3" {
      bucket = "test-eks-terraform-state"
      key = "backend/test.tfstate"
      region = "ap-northeast-2"
      profile = "testkey"
      # encrypt = true
  }
}


provider "kubernetes" {
  host                   = module.app_cluster.cluster_endpoint
  cluster_ca_certificate = base64decode(module.app_cluster.cluster_certificate_authority_data)

  exec {
    api_version = "client.authentication.k8s.io/v1alpha1"
    command     = "aws"
    # This requires the awscli to be installed locally where Terraform is executed
    args = ["eks", "get-token", "--cluster-name", module.app_cluster.cluster_id]
  }
}