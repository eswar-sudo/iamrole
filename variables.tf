variable "name" {
  description = "Name of Role to create."
  type        = string
}

variable "assume_role_policy" {
  description = "Policy restricting when this role can be assumed."
  type = any
}

variable "path" {
  description = "Role path."
  type = string
  default = "" 
}

variable "managed_policy_arns" {
  description = "List of AWS managed policy ARNs to attach to the role"
  type        = list(string)
  default     = []
}
