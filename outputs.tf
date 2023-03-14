output "state_bucket_name" {
  value = var.bucket_name
}

output "state_table_name" {
  value = var.dynamodb_table_name
}

output "state_table_arn" {
  value = aws_dynamodb_table.terraform-state-lock.arn
}
