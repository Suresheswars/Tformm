variable "mysg" {
  type    = string
  default = "dev_sg"
}

variable "port" {
  type    = number
  default = 22
}

variable "ami" {
  type    = string
  default = "ami-06cffe063efe892ad"
}

variable "env" {
  type    = string
  default = "DEV"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "instance_count" {
  type  = number
  count = 2
}
variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/24"
}
variable "mysubnets" {
  default = {

    env_subnet = {
      pubsbnet = "10.0.8.0/24"
      prisbnet = "10.0.10.0/24"
    }
  }
}
