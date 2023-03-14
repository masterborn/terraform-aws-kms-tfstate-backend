# template of terraform resource repository

<!-- START_OF_AUTO_GENERATED_SECTION -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~>1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~>4.20.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~>4.20.0 |
## Resources

| Name | Type |
|------|------|
| [aws_dynamodb_table.terraform-state-lock](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table) | resource |
| [aws_kms_alias.state](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.state](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_s3_bucket.bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.acl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_public_access_block.bucket-acl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.state_encryption](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.state_versioning](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | S3 state bucket name | `string` | n/a | yes |
| <a name="input_dynamodb_table_name"></a> [dynamodb\_table\_name](#input\_dynamodb\_table\_name) | DynamoDB state lock table name | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | `{}` | no |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | n/a | `map(string)` | <pre>{<br>  "Module": "terraform-state"<br>}</pre> | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_state_bucket_name"></a> [state\_bucket\_name](#output\_state\_bucket\_name) | n/a |
| <a name="output_state_table_name"></a> [state\_table\_name](#output\_state\_table\_name) | n/a |
| <a name="output_state_table_arn"></a> [state\_table\_arn](#output\_state\_table\_arn) | n/a |

## Examples

### Basic example
```hcl
module "string_ssm_keys" {
  source              = "git@github.com:masterborn/terraform-kms-tfstate-backend.git?ref=v1.0.1"
  bucket_name         = "example-state-bucket"
  dynamodb_table_name = "example-state-lock"

  tags = {
    Env = "Org"
  }
}
```

Then in backend configuration:
```hcl
    backend "s3" {
      region         = "us-east-1"
      bucket         = "example-state-bucket"
      key            = "path/to/file/terraform.tfstate"
      dynamodb_table = "example-state-lock"
      encrypt        = true
    }
```
<!-- END_OF_AUTO_GENERATED_SECTION -->

## Enabling pre-commit hooks

Following pre-commit hooks are provided:

- [terraform-fmt](https://github.com/antonbabenko/pre-commit-terraform#terraform_fmt) to check syntax of terraform
- [terraform-docs](https://github.com/terraform-docs/terraform-docs) to recreate README.md according to terraform module properties
- [end-of-file-fixer](https://github.com/pre-commit/pre-commit-hooks#end-of-file-fixer) to ensure that each file ends with newline

### Requirements

- [pre-commit](https://pre-commit.com/#installation)

### Installation
To install `pre-commit` check .

```bash
pre-commit install
```
