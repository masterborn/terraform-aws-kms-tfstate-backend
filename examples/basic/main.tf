module "string_ssm_keys" {
  source              = "git@github.com:masterborn/terraform-kms-tfstate-backend.git?ref={{ provider_version }}"
  bucket_name         = "example-state-bucket"
  dynamodb_table_name = "example-state-lock"

  tags = {
    Env = "Org"
  }
}
