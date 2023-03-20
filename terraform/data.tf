data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

data "aws_default_tags" "current" {}

data "terraform_remote_state" "eks-state" {
  backend = "s3"
  config = {
    bucket = "test-eks-terraform-state"
    key    = "${var.environment}/eks.tfstate"
    region = var.aws_region
  }
}