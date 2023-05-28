#module "instance_creation" {
#  source  = "../modules"
#  sgname  = var.sgname
#  sshport = var.sshport
#  amiid   = var.amiid
#  env     = var.env
#  type    = var.type
#}

module "platform_creation" {
  source         = "../modules"
  cidr           = var.vpc_cidr
  mytag          = var.devtag
  public_subnet  = var.public_subnet
  private_subnet = var.private_subnet
  az             = var.az
  sgname         = var.sgname
  sshport        = var.sshport
  amiid          = var.amiid
  type           = var.type
  ingress_rules  = var.firewall_rule
  rolename       = var.rolename
  profile        = var.profile
}