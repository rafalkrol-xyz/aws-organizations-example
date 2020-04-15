variable "content" {
  description = "The content of the policy"
  type        = string
}

variable "name" {
  description = "The name of the policy."
  type        = string
}

variable "description" {
  description = "The description of the policy"
  type        = string
}
variable "type" {
  description = "The type of the policy; either SERVICE_CONTROL_POLICY or TAG_POLICY"
  type        = string
}

variable "target_id" {
  description = "The list of IDs of the targets to which the policy should be attached to; can be: the root account, an organizational unit or a non-root account"
  type        = list(string)
}
