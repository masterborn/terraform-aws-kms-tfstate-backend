## Examples

### Basic example
```hcl
{{ include "./basic/main.tf" }}
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
