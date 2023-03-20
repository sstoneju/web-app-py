aws_region = "ap-northeast-2"
environment = "stage"
eks_node_instance_types = ["t3.large"]
capacity_type = "ON_DEMAND"
log_group_retention = 5

test_node = {
  min_size       = 1,
  max_size       = 2,
  instance_types = ["t3.large"]
}