output "glue_database_name" {
  description = "The name of the Glue database"
  value       = aws_glue_catalog_database.example.name
}
