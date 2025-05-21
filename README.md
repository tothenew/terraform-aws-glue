# terraform-aws-glue

[![Lint Status](https://github.com/your-organization/terraform-aws-glue/workflows/Lint/badge.svg)](https://github.com/your-organization/terraform-aws-glue/actions)  
[![LICENSE](https://img.shields.io/github/license/your-organization/terraform-aws-glue)](https://github.com/your-organization/terraform-aws-glue/blob/master/LICENSE)

This Terraform module provisions and configures **AWS Glue** resources, specifically **Glue Databases** and **Glue Jobs**, within a given AWS environment. It supports defining custom job properties such as script location, IAM role, connections, and job capacity.

By default, this module configures Glue Jobs to use **AWS Glue version 2.0** with support for Python 3.

The following resources will be created:

- AWS Glue Database
- AWS Glue Job
- IAM Role for Glue Job Execution (external)

## Usage

```hcl
module "glue_database" {
  source             = "./module/glue_databases"
  glue_database_name = "example_database"
}

module "glue_job" {
  source               = "./module/glue_jobs"
  glue_job_name        = "example_glue_job"
  glue_script_location = "s3://bucket/scripts/script.py"
  glue_role            = aws_iam_role.glue_service_role.arn
}
```

<!-- BEGIN_TF_DOCS -->

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.11.3 |

## Providers

| Name | Version |
| ---- | ------- |
| aws  | n/a     |

## Modules

| Name          | Source                  | Version |
| ------------- | ----------------------- | ------- |
| glue_database | ./module/glue_databases | n/a     |
| glue_job      | ./module/glue_jobs      | n/a     |

## Resources

| Name                             | Type     |
| -------------------------------- | -------- |
| aws_glue_catalog_database        | resource |
| aws_glue_job                     | resource |
| aws_iam_role.glue_service_role   | resource |

## Inputs

| Name                     | Description                                                | Type          | Default                  | Required |
| ------------------------ | ---------------------------------------------------------- | ------------- | ------------------------ | :------: |
| glue_database_name       | The name of the Glue database                              | string        | `"example_database"`      |   yes    |
| tags                     | Tags to associate with the Glue resources                  | map(string)   | `{}`                      |   no     |
| glue_job_name            | The name of the Glue job                                   | string        | `"example_glue_job"`      |   yes    |
| glue_script_location     | The S3 location of the Glue job script                     | string        | `"s3://bucket/scripts/script.py"` |   yes    |
| glue_role                | ARN of the IAM role for Glue job execution                 | string        | n/a                       |   yes    |
| name                     | A name for the Glue job                                    | string        | `"example_job_name"`      |   yes    |
| python_version           | The Python version for the Glue job (2 or 3)               | string        | `"3"`                     |   no     |
| glue_version             | The Glue version to use for the job                        | string        | `"2.0"`                   |   no     |
| max_capacity             | The maximum capacity to allocate for the Glue job          | number        | `10`                      |   no     |
| glue_connections         | List of Glue connection names to be associated with the job | list(string)  | `[]`                      |   no     |
| timeout                  | Timeout (in minutes) for the Glue job                      | number        | `60`                      |   no     |

## Outputs

| Name              | Description                                    |
| ----------------- | ---------------------------------------------- |
| glue_database_id  | ID of the Glue database                        |
| glue_job_id       | ID of the Glue job                             |
| glue_job_arn      | ARN of the Glue job                            |

## Authors

Module managed by [Your Organization](https://github.com/your-organization)

## License

Apache 2 Licensed. See [LICENSE](https://github.com/your-organization/terraform-aws-glue/blob/main/LICENSE) for full details.
