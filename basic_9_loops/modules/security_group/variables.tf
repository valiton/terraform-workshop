variable "name" {
  type = string
  description = "Name of the security group"
}

variable "from_port" {
  type = number
  description = "First port in range to open"
}

variable "to_port" {
  type = number
  description = "Last port in range to open"
}