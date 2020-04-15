variable "name" {
  description = "After the Terraform docs: 'A friendly name for the member account. "
}

variable "email" {
  description = "After the Terraform docs: 'The email address of the owner to assign to the new member account. This email address must not already be associated with another AWS account.'"
}

variable "parent_id" {
  description = "After the Terraform docs: 'Parent Organizational Unit ID or Root ID for the account. Defaults to the Organization default Root ID. A configuration must be present for this argument to perform drift detection.'"
}

variable "role_name" {
  description = "After the Terraform docs: 'The name of an IAM role that Organizations automatically preconfigures in the new member account. This role trusts the master account, allowing users in the master account to assume the role, as permitted by the master account administrator. The role has administrator permissions in the new member account. (...)'"
  type        = string
  default     = null
}
