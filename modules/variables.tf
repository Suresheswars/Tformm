variable "sgname" {
  type    = string
  default = "This is my sg group"
}
variable "sgport" {
  type    = string
  default = "to allow the ports"
}
variable "amiid" {
  type    = string
  default = "AMIID from Amazon"
}

variable "environment" {
  type    = string
  default = "This is my Environment"
}
variable "inst_type" {
  type    = string
  default = "Types of Instances"
}

variable "cidr" {
  type    = string
  default = "my cidr blocks"
}

variable "subnetss" {
  type    = string
  default = "my subnets"
}