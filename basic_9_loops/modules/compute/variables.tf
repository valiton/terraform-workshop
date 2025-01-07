variable "names" {
  type        = set(string)
  description = "The Name  for the compute instance"
  default     = null
}

variable "flavor_name" {
  type        = string
  description = "The flavour to use with the compute instance"
  default     = "BWS-C1-1-2" #BWS-C1-1-2
}

variable "security_groups" {
  type        = list(string)
  description = "Names of security groups to attach to this instance"
  default     = null
}

