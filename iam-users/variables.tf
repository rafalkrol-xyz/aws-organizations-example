### USERS - START
variable "create-aws_iam_user" {
  description = "A flag indicating whether an IAM user should be created"
  default     = true
}

variable "create-aws_iam_user_login_profile" {
  description = "A flag indicating whether an IAM user login (for AWS Console) should be created for a given user"
  default     = true
}

variable "create-aws_iam_access_key" {
  description = "A flag indicating whether an IAM access key ('a set of credentials that allow API requests to be made as an IAM user') should be created for a given user"
  default     = true
}

variable "create-aws_iam_user_group_membership" {
  description = "A flag indicating whether a group membership should be created for a given user"
  default     = true
}

variable "groups" {
  description = "A list of groups the user should become a member of"
  type        = list(string)
}

variable "name" {
  description = "The name of the IAM user"
  type        = string
}

variable "path" {
  description = "The path in which the IAM user should be created"
  type        = string
  default     = "/users/"
}

variable "force_destroy" {
  description = "After the terraform docs: 'When destroying this user, destroy even if it has non-Terraform-managed IAM access keys, login profile or MFA devices. Without force_destroy a user with non-Terraform-managed access keys and login profile will fail to be destroyed.'"
  default     = false
}

variable "password_reset_required" {
  description = "Whether the user should be forced to reset the generated password on first login."
  default     = false
}

variable "pgp_key" {
  description = "Either a base-64 encoded PGP public key, or a keybase username in the form keybase:username. Used to encrypt the password and the access key on output to the console."
  default     = ""
}
### USERS - END
