variable "aws_region" {
  type = string
}

variable "environment" {
  type = string
}

variable "eks_node_instance_types" {
  type = list
}

variable "capacity_type" {
  type = string
}

variable "log_group_retention" {
  type = string
}

variable "test_node" {
  type = any
  default = {}
}
