variable "glue_database_name" {
  description = "Name of the Glue database"
  type        = string
}

variable "glue_job_name" {
  description = "Name of the Glue job"
  type        = string
}

variable "glue_script_location" {
  description = "S3 location of the Glue job script"
  type        = string
}


variable "name" {
  description = "General name for resources"
  type        = string
}

variable "python_version" {
  description = "Python version for Glue job"
  type        = string
}

variable "glue_version" {
  description = "Glue version to use"
  type        = string
}

variable "max_capacity" {
  description = "Max capacity for Glue job"
  type        = number
}

variable "glue_connections" {
  description = "List of Glue connections"
  type        = list(string)
}

variable "timeout" {
  description = "Timeout for Glue job in minutes"
  type        = number
}


variable "tags" {
  description = "Common tags to apply"
  type        = map(string)
}