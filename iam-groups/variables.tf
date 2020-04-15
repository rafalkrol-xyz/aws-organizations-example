### GROUPS - START
variable "name" {
  description = "The name of the IAM group"
  type        = string
}

variable "enable-AdministratorAccess" {
  description = "A flag for enabling the AWS Managed AdministratorAccess policy"
  default     = false
}

variable "enable-AWSCodeBuildDeveloperAccess" {
  description = "A flag for enabling the AWS Managed AWSCodeBuildDeveloperAccess policy"
  default     = false
}
### GROUPS - END
