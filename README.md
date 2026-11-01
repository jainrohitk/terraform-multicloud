# terraform-multicloud
# terraform-multicloud
# terraform-multicloud

## Learning guides

- [Understanding null in Terraform: four examples](./docs/null-expressions/README.md)

## Remote upload exclusions

[.terraformignore](./.terraformignore) excludes Git metadata, local Terraform
data (except downloaded modules), state, saved plans, logs, and local variable
values from CLI-driven uploads to HCP Terraform. Configuration files, provider
lock files, and `terraform.tfvars.example` files remain included. Supply remote
variable values through HCP Terraform.

Terraform reads this file only at the upload configuration root. If you run from
a cloud or environment subdirectory, place a copy at that upload root. This file
does not affect local Terraform runs or replace [.gitignore](./.gitignore).
