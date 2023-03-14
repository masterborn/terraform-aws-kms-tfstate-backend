# template of terraform resource repository

<!-- START_OF_AUTO_GENERATED_SECTION -->
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
