resource "aws_dynamodb_table" "terraform-state-lock" {
  name         = var.dynamodb_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = local.tags
}

resource "aws_kms_key" "state" {
  description         = "Key for terraform remote state backend bucket"
  enable_key_rotation = true
  tags                = var.tags
}

resource "aws_kms_alias" "state" {
  name          = "alias/state-storage"
  target_key_id = aws_kms_key.state.key_id
}

resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  acl    = "private"


  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.state.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }

  tags = local.tags
}

resource "aws_s3_bucket_public_access_block" "bucket-acl" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
