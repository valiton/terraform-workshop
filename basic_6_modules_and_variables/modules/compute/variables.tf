variable "name" {
  type        = string
  description = "The Name tag for the comute instance"
}

variable "image_name" {
  type        = string
  description = "The image name to use with the compute instance"
  default     = "Debian 12"
}

variable "flavor_name" {
  type        = string
  description = "The flavour to use with the compute instance"
  default     = "BWS-C1-1-2" #BWS-C1-1-2
}
