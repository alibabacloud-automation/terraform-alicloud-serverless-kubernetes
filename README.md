Alibaba Cloud Serverless Kubernetes Cluster Terraform Module
terraform-alicloud-serverless-kubernetes
=====================================================================

English | [简体中文](https://github.com/terraform-alicloud-modules/terraform-alicloud-serverless-kubernetes/blob/master/README-CN.md)

Terraform module which creates serverless kubernetes cluster on Alibaba Cloud.

These types of resources are supported:

* [Serverless Kubernetes](https://www.terraform.io/docs/providers/alicloud/r/cs_serverless_kubernetes.html)


## Terraform versions

The Module requires Terraform 0.12 and Terraform Provider AliCloud 1.56.0+.

## Usage

```hcl
module "serverless-k8s" {
  source                  = "terraform-alicloud-modules/serverless-kubernetes/alicloud"
  region                  = "cn-beijing"
  profile                 = "Your-Profile-Name"
  serverless_cluster_name = "CreateByTerraform"
  vpc_id                  = "vpc-2ze2w0xxxxxxx"
  vswitch_id              = "vsw-1q21xxxxxxxxx"
  # ... omitted
}

```

## Examples

* [Basic example](https://github.com/terraform-alicloud-modules/terraform-alicloud-serverless-kubernetes/tree/master/examples/basic-example)

## Notes

* This module using AccessKey and SecretKey are from `profile` and `shared_credentials_file`.
If you have not set them yet, please install [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) and configure it.

Submit Issues
-------------
If you have any problems when using this module, please opening a [provider issue](https://github.com/terraform-providers/terraform-provider-alicloud/issues/new) and let us know.

**Note:** There does not recommend to open an issue on this repo.

Authors
-------
Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com)

License
----
Apache 2 Licensed. See LICENSE for full details.

Reference
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)