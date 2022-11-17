<!-- Update the title to match the module name and add a description -->
# Terraform IBM Module Template

<!-- UPDATE BADGE: Update the link for the badge below-->
[![Build Status](https://github.com/terraform-ibm-modules/terraform-ibm-module-template/actions/workflows/ci.yml/badge.svg)](https://github.com/terraform-ibm-modules/terraform-ibm-module-template/actions/workflows/ci.yml)
[![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)

<!-- Remove the content in this H2 heading after completing the steps -->

## Submit a new module

:+1::tada: Thank you for taking the time to contribute! :tada::+1:

This template repository exists to help you create Terraform modules for IBM Cloud.

The default structure includes the following files:

- `README.md`: A description of the module
- `main.tf`: The logic for the module
- `version.tf`: The required terraform and provider versions
- `variables.tf`: The input variables for the module
- `outputs.tf`: The values that are output from the module

For more information, see [Module structure](https://terraform-ibm-modules.github.io/documentation/#/module-structure) in the project documentation.

You can add other content to support what your module does and how it works. For example, you might add a `scripts/` directory that contains shell scripts that are run by a `local-exec` `null_resource` in the Terraform module.

Follow this process to create and submit a Terraform module.

### Create a repo from this repo template

1.  Create a repository from this repository template by clicking `Use this template` in the upper right of the GitHub UI.

    For more information about creating a repository from a template, see the [GitHub docs](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template).
1.  Select `terraform-ibm-modules` as the owner.
1.  Enter a name for the module in format `terraform-ibm-<NAME>`, where `<NAME>` reflects the type of infrastructure that the module manages.

    Use hyphens as delimiters for names with multiple words (for example, terraform-ibm-`activity-tracker`).
1.  Provide a short description of the module.

    The description is displayed under the repository title on the [organization page](https://github.com/terraform-ibm-modules) and in the **About** section of the repository. Use the description to help users understand what your repo does by looking at the description.

### Clone the repo and set up your development environment

Locally clone the new repository and set up your development environment by completing the tasks in [Local development setup](https://terraform-ibm-modules.github.io/documentation/#/local-dev-setup) in the project documentation.

### Update the Terraform files

Implement the logic for your module by updating the `main.tf`, `version.tf`, `variables.tf`, and `outputs.tf` Terraform files. For more information, see [Creating Terraform on IBM Cloud templates](https://cloud.ibm.com/docs/ibm-cloud-provider-for-terraform?topic=ibm-cloud-provider-for-terraform-create-tf-config).

### Create examples and tests

Add one or more examples in the `examples` directory that consume your new module, and configure tests for them in the `tests` directory.

### Update the content in the readme file

After you implement the logic for your module and create examples and tests, update this readme file in your repository by following these steps:

1.  Update the title heading and add a description about your module.
1.  Update the badge links.
1.  Remove all the content in this H2 heading section.
1.  Complete the [Usage](#usage), [Required IAM access policies](#required-iam-access-policies), and [Examples](#examples) sections. The [Requirements](#requirements) section is populated by a pre-commit hook.

### Commit your code and submit your module for review

1.  Before you commit any code, review [Contributing to the IBM Cloud Terraform modules project](https://terraform-ibm-modules.github.io/documentation/#/contribute-module) in the project documentation.
1.  Create a pull request for review.

### Post-merge steps
After the first PR for your module is merged, follow these post-merge steps:

1.  Create a PR to enable the upgrade test by removing the `t.Skip` line in `tests/pr_test.go`.

<!-- Remove the content in this previous H2 heading -->

## Usage

<!--
Add an example of the use of the module in the following code block.

Use real values instead of "var.<var_name>" or other placeholder values
unless real values don't help users know what to change.
-->

```hcl

```

## Required IAM access policies

<!-- PERMISSIONS REQUIRED TO RUN MODULE
If this module requires permissions, uncomment the following block and update
the sample permissions, following the format.
Replace the sample Account and IBM Cloud service names and roles with the
information in the console at
Manage > Access (IAM) > Access groups > Access policies.
-->

<!--
You need the following permissions to run this module.

- Account Management
    - **Sample Account Service** service
        - `Editor` platform access
        - `Manager` service access
- IAM Services
    - **Sample Cloud Service** service
        - `Administrator` platform access
-->

<!-- NO PERMISSIONS FOR MODULE
If no permissions are required for the module, uncomment the following
statement instead the previous block.
-->

<!-- No permissions are needed to run this module.-->

<!-- BEGIN EXAMPLES HOOK -->
## Examples

- [Examples](examples)
<!-- END EXAMPLES HOOK -->

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.3.0 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | >=1.43.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_acl_list_to_map"></a> [acl\_list\_to\_map](#module\_acl\_list\_to\_map) | ./list_to_map | n/a |
| <a name="module_subnet_list_to_map"></a> [subnet\_list\_to\_map](#module\_subnet\_list\_to\_map) | ./list_to_map | n/a |

## Resources

| Name | Type |
|------|------|
| [ibm_is_subnet.subnet](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_subnet) | resource |
| [ibm_is_vpc_address_prefix.subnet_prefix](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_vpc_address_prefix) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_network_acls"></a> [network\_acls](#input\_network\_acls) | List of ACLs to be used for subnets. | <pre>list(<br>    object({<br>      id   = string<br>      name = string<br>    })<br>  )</pre> | `[]` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | The prefix that you would like to append to your resources | `string` | `"subnet"` | no |
| <a name="input_prepend_prefix_to_network_acl_names"></a> [prepend\_prefix\_to\_network\_acl\_names](#input\_prepend\_prefix\_to\_network\_acl\_names) | Add the prefix to network acl names when looking them up from `network_acls` variable. | `bool` | `true` | no |
| <a name="input_public_gateways"></a> [public\_gateways](#input\_public\_gateways) | Map of public gatways | <pre>object({<br>    zone-1 = string<br>    zone-2 = string<br>    zone-3 = string<br>  })</pre> | <pre>{<br>  "zone-1": null,<br>  "zone-2": null,<br>  "zone-3": null<br>}</pre> | no |
| <a name="input_region"></a> [region](#input\_region) | The region to which to deploy the VPC | `string` | `"us-south"` | no |
| <a name="input_resource_group_id"></a> [resource\_group\_id](#input\_resource\_group\_id) | ID of the resource group where subnets will be provisioned | `string` | `null` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | List of subnets for the vpc. For each item in each array, a subnet will be created. Items can be either CIDR blocks or total ipv4 addressess. Public gateways will be enabled only in zones where a gateway has been created | <pre>object({<br>    zone-1 = list(object({<br>      name           = string<br>      cidr           = string<br>      public_gateway = optional(bool)<br>      acl_name       = string<br>    }))<br>    zone-2 = list(object({<br>      name           = string<br>      cidr           = string<br>      public_gateway = optional(bool)<br>      acl_name       = string<br>    }))<br>    zone-3 = list(object({<br>      name           = string<br>      cidr           = string<br>      public_gateway = optional(bool)<br>      acl_name       = string<br>    }))<br>  })</pre> | <pre>{<br>  "zone-1": [<br>    {<br>      "acl_name": "vpc-acl",<br>      "cidr": "10.10.10.0/24",<br>      "name": "subnet-a",<br>      "public_gateway": true<br>    }<br>  ],<br>  "zone-2": [<br>    {<br>      "acl_name": "vpc-acl",<br>      "cidr": "10.20.10.0/24",<br>      "name": "subnet-b",<br>      "public_gateway": true<br>    }<br>  ],<br>  "zone-3": [<br>    {<br>      "acl_name": "vpc-acl",<br>      "cidr": "10.30.10.0/24",<br>      "name": "subnet-c",<br>      "public_gateway": false<br>    }<br>  ]<br>}</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | List of Tags for the resource created | `list(string)` | `null` | no |
| <a name="input_use_manual_address_prefixes"></a> [use\_manual\_address\_prefixes](#input\_use\_manual\_address\_prefixes) | True if using manual address prefix creation. If false, address prefixes will be created in the VPC automatically | `bool` | `false` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | ID of the VPC where subnets will be created | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_subnet_zone_list"></a> [subnet\_zone\_list](#output\_subnet\_zone\_list) | A list containing subnet IDs and subnet zones |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- Leave this section as is so that your module has a link to local development environment set up steps for contributors to follow -->

## Contributing

You can report issues and request features for this module in the [terraform-ibm-issue-tracker](https://github.com/terraform-ibm-modules/terraform-ibm-issue-tracker/issues) repo. See [Report an issue or request a feature](https://github.com/terraform-ibm-modules/.github/blob/main/.github/SUPPORT.md).

To set up your local development environment, see [Local development setup](https://terraform-ibm-modules.github.io/documentation/#/local-dev-setup) in the project documentation.
