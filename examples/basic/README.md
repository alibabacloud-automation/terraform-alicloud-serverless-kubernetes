# Complete Serverless Kubernetes example

Configuration in this directory creates set of Serverless Kubernetes resource in various combinations.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which cost money. Run `terraform destroy` when you don't need these resources.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Outputs

| Name | Description |
|------|-------------|
| this\_vpc\_id | The ID of the ECS instance |
| this\_vswitch\_id | The ID of the Vswitch |
| this\_cluster\_id | ID of the kunernetes cluster  |
| this\_deletion\_protection | Whether to set delete protection |
| this\_endpoint\_public\_access\_enabled | Whether enable public access or not |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
