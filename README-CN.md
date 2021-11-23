Alibaba Cloud Serverless Kubernetes Cluster Terraform Module
terraform-alicloud-serverless-kubernetes

本 Module 用于在阿里云搭建无服务器 Kubernetes 集群. 

本 Module 支持创建以下资源:

* [Serverless Kubernetes](https://www.terraform.io/docs/providers/alicloud/r/cs_serverless_kubernetes.html)

## 用法

```hcl
module "serverless-k8s" {
  source                  = "terraform-alicloud-modules/serverless-kubernetes/alicloud"
  serverless_cluster_name = "CreateByTerraform"
  vpc_id                  = "vpc-2ze2w0xxxxxxx"
  vswitch_id              = "vsw-1q21xxxxxxxxx"
  # ... 省略选填字段
}

```

## 示例

* [基础示例](https://github.com/terraform-alicloud-modules/terraform-alicloud-serverless-kubernetes/tree/master/examples/basic-example)

## 注意事项
本Module从版本v1.1.0开始已经移除掉如下的 provider 的显示设置：

```hcl
provider "alicloud" {
  profile                 = var.profile != "" ? var.profile : null
  shared_credentials_file = var.shared_credentials_file != "" ? var.shared_credentials_file : null
  region                  = var.region != "" ? var.region : null
  skip_region_validation  = var.skip_region_validation
  configuration_source    = "terraform-alicloud-modules/serverless-kubernetes"
}
```

如果你依然想在Module中使用这个 provider 配置，你可以在调用Module的时候，指定一个特定的版本，比如 1.0.0:

```hcl
module "serverless-k8s" {
  source                  = "terraform-alicloud-modules/serverless-kubernetes/alicloud"
  version                 = "1.0.0"
  region                  = "cn-beijing"
  profile                 = "Your-Profile-Name"
  serverless_cluster_name = "CreateByTerraform"
  vpc_id                  = "vpc-2ze2w0xxxxxxx"
  vswitch_id              = "vsw-1q21xxxxxxxxx"
  // ...
}
```

如果你想对正在使用中的Module升级到 1.1.0 或者更高的版本，那么你可以在模板中显示定义一个系统过Region的provider：
```hcl
provider "alicloud" {
  region  = "cn-beijing"
  profile = "Your-Profile-Name"
}
module "serverless-k8s" {
  source                  = "terraform-alicloud-modules/serverless-kubernetes/alicloud"
  serverless_cluster_name = "CreateByTerraform"
  vpc_id                  = "vpc-2ze2w0xxxxxxx"
  vswitch_id              = "vsw-1q21xxxxxxxxx"
  // ...
}
```
或者，如果你是多Region部署，你可以利用 `alias` 定义多个 provider，并在Module中显示指定这个provider：

```hcl
provider "alicloud" {
  region  = "cn-beijing"
  profile = "Your-Profile-Name"
  alias   = "bj"
}
module "serverless-k8s" {
  source                  = "terraform-alicloud-modules/serverless-kubernetes/alicloud"
  providers               = {
    alicloud = alicloud.bj
  }
  serverless_cluster_name = "CreateByTerraform"
  vpc_id                  = "vpc-2ze2w0xxxxxxx"
  vswitch_id              = "vsw-1q21xxxxxxxxx"
  // ...
}
```

定义完provider之后，运行命令 `terraform init` 和 `terraform apply` 来让这个provider生效即可。

更多provider的使用细节，请移步[How to use provider in the module](https://www.terraform.io/docs/language/modules/develop/providers.html#passing-providers-explicitly)

## Terraform 版本

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.56.0 |

提交问题
-------
如果在使用该 Terraform Module 的过程中有任何问题，可以直接创建一个 [Provider Issue](https://github.com/terraform-providers/terraform-provider-alicloud/issues/new)，我们将根据问题描述提供解决方案。

**注意:** 不建议在该 Module 仓库中直接提交 Issue。

作者
-------
Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com)

许可
----
Apache 2 Licensed. See LICENSE for full details.

参考
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)