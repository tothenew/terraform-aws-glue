resource "aws_glue_catalog_database" "example" {
  name = var.glue_database_name
  tags = var.tags
}
