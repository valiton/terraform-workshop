variable "name" {
  type        = string
  description = "The Name tag for the EC2 instance"
}

variable "instance_type" {
  type        = string
  description = "The instance type to use with the EC2 instance"
  default     = "t3.nano"
}
