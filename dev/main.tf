module "platform_implement" {
  source      = "../modules"
  cidr        = var.vpc_cidr
  environment = var.env
  subnetss    = var.mysubnets
  sgname      = var.mysg
  sgport      = var.port
  amiid       = var.ami
  inst_type   = var.instance_type
  count       = var.instance_count
}