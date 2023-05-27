variable "cidr" {
  type        = string
  description = "VPC cidr"
}

variable "mytag" {
  type = object({
    Environment = string
    Stack_type  = string
  })
}

variable "public_subnet" {
  type = list(string)
}

variable "private_subnet" {
  type = list(string)
}

variable "az" {
  type = list(string)
}

######ec2 specific variables #############3
variable "sgname" {
  type        = string
  description = "this is the name of security group"
}

variable "sshport" {
  type    = number
  default = 22
}

variable "amiid" {
  type        = string
  description = "This is ami id of specific environments"
}

variable "type" {
  type        = string
  description = "This is type of instance based on environment"
}

####################

variable "ingress_rules" {
  type = list(object({
    from_port   = number
    protocol    = string
    to_port     = number
    cidr_blocks = list(string)
  }))
}

variable "rolename" {
  type = string
}

variable "profile" {
  type = string
}