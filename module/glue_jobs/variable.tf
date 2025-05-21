variable "glue_role" {
  description = "IAM role ARN to be used by Glue"
  type        = string
}

variable "glue_job_name" {
  description = "The name of the Glue Job"
  type        = string
}

variable "glue_script_location" {
  description = "The location of the Glue script"
  type        = string
}

variable "name" {
  description = "The name of the job"
  type        = string
}

variable "python_version" {
  description = "The pthon version of the job"
  type        = string
}

variable "glue_version" {
  description = "The glue version of the job"
  type        = string
}

variable "max_capacity" {
  description = "The max_capacity of the job"
  type        = string
}

variable "glue_connections" {
  description = "List of Glue connections"
  type        = list(string)
  default     = []
  }

variable "timeout" {
  description = "The timeout of the job"
  type        = number
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to add to all resources"
}