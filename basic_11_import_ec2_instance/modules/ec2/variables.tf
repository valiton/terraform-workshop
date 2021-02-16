variable "names" {
  type        = set(string)
  description = "The Name tag for the EC2 instance"
  default     = null
}

variable "instance_type" {
  type        = string
  description = "The instance type to use with the EC2 instance"
  default     = "t3.nano"
}

variable "security_groups" {
  type        = list(string)
  description = "Names of security groups to attach to this instance"
  default     = null
}
