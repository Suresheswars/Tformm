variable "sgname" {
  type = string
  default = "prosg"
}

variable "sshport" {
  type = number
  default = 22
}

variable "amiid" {
  type = string
  default = "ami-06cffe063efe892ad"
}

variable "env" {
  type = string
  default = "PRO"
}

variable "type" {
  type = string
  default = "t2.medium"
}