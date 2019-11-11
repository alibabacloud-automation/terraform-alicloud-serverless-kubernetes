Alibaba Cloud terraform example for kubernetes cluster
======================================================

A terraform example to launching a serverless kubernetes cluster in alibaba cloud.

These types of the module resource are supported:

- [VPC](https://www.terraform.io/docs/providers/alicloud/r/vpc.html)
- [Subnet](https://www.terraform.io/docs/providers/alicloud/r/vswitch.html)
- [Serverless](https://www.terraform.io/docs/providers/alicloud/r/cs_serverless_kubernetes.html)


Usage
-----
This example can specify the following arguments to create user-defined kuberntes cluster

* alicloud_access_key: The Alicloud Access Key ID
* alicloud_secret_key: The Alicloud Access Secret Key
* region: The ID of region in which launching resources
* serverless_cluster_name: The name  of serverless cluster
* Other kubernetes cluster arguments

**Note:** In order to avoid some needless error, you had better to set `new_nat_gateway` to `true`.
Otherwise, you must you must ensure you specified vswitches can access internet before running the example.

Planning phase

    terraform plan

Apply phase

	terraform apply


Destroy

    terraform destroy


Conditional creation
--------------------
This example can support the following creating kubernetes cluster scenario.

### 1. Retrieve existing vswitch by tags and name regex .

You can specify the following user-defined arguments:

* vswitch_name_regex: A default filter applied to retrieve existing vswitches by name regex.
* vswitch_tags: A default filter applied to retrieve existing vswitches by tags.
* vswitch_resource_group_id: A default filter applied to retrieve existing vswitches by resource group id.

### 2. Set existing vpc id and vswitch id for the cluster.

You can specify the following user-defined arguments:

* vpc_id: A existing vpc ID.
* vswitch_id: The of ID for an existing vswitch ID.


Terraform version
-----------------
Terraform version 0.12.0 or newer and Provider version 1.58.0 or newer are required for this example to work.

Authors
-------
Created and maintained by Meng Xiaobing(@menglingwei, menglingwei@gmail.com)

License
-------
Mozilla Public License 2.0. See LICENSE for full details.

Reference
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/)



