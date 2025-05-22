variable "glue_database_name" {
  description = "The name of the Glue Database"
  type        = string
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to add to all resources"
}