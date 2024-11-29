variable "names" {
  type        = set(string)
  description = "The Name  for the compute instance"
  default     = null
}

variable "flavour_id" {
  type        = string
  description = "The flavour to use with the compute instance"
  default     = "77817206-3c5a-4e22-884d-fe4034aed917" #BWS-C1-1-2
}

variable "security_groups" {
  type        = list(string)
  description = "Names of security groups to attach to this instance"
  default     = null
}

