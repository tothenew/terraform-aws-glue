resource "aws_glue_job" "example" {
  name     = var.glue_job_name
  role_arn = var.glue_role
  glue_version    = var.glue_version

  command {
    name            = var.name
    script_location = var.glue_script_location
    python_version  = var.python_version
  }

  max_capacity = var.max_capacity
  connections  = var.glue_connections
  timeout      = var.timeout
  tags         = var.tags
}
