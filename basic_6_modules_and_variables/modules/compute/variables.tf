variable "name" {
  type        = string
  description = "The Name tag for the comute instance"
}

variable "image_name" {
  type        = string
  description = "The image name to use with the compute instance"
  default     = "Debian 12"
}

variable "flavour_id" {
  type        = string
  description = "The flavour to use with the compute instance"
  default     = "77817206-3c5a-4e22-884d-fe4034aed917" #BWS-C1-1-2
}
