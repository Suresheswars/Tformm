variable "sgname" {
  type    = string
  default = "accsg"
}

variable "sshport" {
  type    = number
  default = 22
}

variable "amiid" {
  type    = string
  default = "ami-0a8b4cd432b1c3063"
}

variable "acctag" {
  default = {
    Environment = "ACC"
    Stack_type  = "Infra"
  }
}

variable "type" {
  type    = string
  default = "t2.micro"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}


variable "public_subnet" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet" {
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "az" {
  default = ["us-west-1b", "us-west-1c"]
}

variable "firewall_rule" {
  default = [
    {
      from_port   = 22
      protocol    = "tcp"
      to_port     = 22
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 80
      protocol    = "tcp"
      to_port     = 80
      cidr_blocks = ["0.0.0.0/0"]
    },
  ]
}


variable "rolename" {
  default = "accinstancerole"
}

variable "profile" {
  default = "accprofile"
}