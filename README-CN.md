Alibaba Cloud Serverless Kubernetes Cluster Terraform Module
terraform-alicloud-serverless-kubernetes
=====================================================================

本 Module 用于在阿里云搭建无服务器 Kubernetes 集群. 

本 Module 支持创建以下资源:

* [Serverless Kubernetes](https://www.terraform.io/docs/providers/alicloud/r/cs_serverless_kubernetes.html)


## Terraform 版本

本 Module 要求使用 Terraform 0.12 和 阿里云 Provider 1.56.0+。

## 用法

```hcl
module "serverless-k8s" {
  source                  = "terraform-alicloud-modules/serverless-kubernetes/alicloud"
  region                  = "cn-beijing"
  profile                 = "Your-Profile-Name"
  serverless_cluster_name = "CreateByTerraform"
  vpc_id                  = "vpc-2ze2w0xxxxxxx"
  vswitch_id              = "vsw-1q21xxxxxxxxx"
  # ... 省略选填字段
}

```

## 示例

* [基础示例](https://github.com/terraform-alicloud-modules/terraform-alicloud-serverless-kubernetes/tree/master/examples/basic-example)

## 注意事项

* 本 Module 使用的 AccessKey 和 SecretKey 可以直接从 `profile` 和 `shared_credentials_file` 中获取。如果未设置，可通过下载安装 [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) 后进行配置.

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