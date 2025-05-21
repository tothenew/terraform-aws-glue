module "glue_database" {
  source             = "./module/glue_databases"
  glue_database_name = var.glue_database_name
  tags               = var.tags
}

module "glue_job" {
  source               = "./module/glue_jobs"
  glue_job_name        = var.glue_job_name
  glue_script_location = var.glue_script_location
  glue_role            = aws_iam_role.glue_service_role.arn
  name                 = var.name
  python_version       = var.python_version
  glue_version         = var.glue_version
  max_capacity         = var.max_capacity
  glue_connections     = var.glue_connections
  timeout              = var.timeout
  tags                 = var.tags
}