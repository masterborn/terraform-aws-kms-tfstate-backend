locals {
  tags = merge(var.default_tags, var.tags)
}

variable "bucket_name" {
  type        = string
  description = "S3 state bucket name"
}

variable "dynamodb_table_name" {
  type        = string
  description = "DynamoDB state lock table name"
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "default_tags" {
  type = map(string)
  default = {
    Module = "terraform-state"
  }
}
