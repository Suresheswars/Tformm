module "instance_creation" {
  source = "../modules"
  sgname = var.sgname
  sshport = var.sshport
  amiid = var.amiid
  env = var.env
  type = var.type
}