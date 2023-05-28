resource "aws_security_group" "global-sg" {
  name        = var.sgname
  description = "allow ports towards public"
  vpc_id      = aws_vpc.global_vpc.id
  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value.from_port
      protocol    = ingress.value.protocol
      to_port     = ingress.value.to_port
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

data "aws_iam_policy_document" "instance-assume-role-policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}


resource "aws_iam_role" "instance_role" {
  name                = var.rolename
  assume_role_policy  = data.aws_iam_policy_document.instance-assume-role-policy.json
  managed_policy_arns = ["arn:aws:iam::aws:policy/AmazonSSMFullAccess", "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"]
}

resource "aws_iam_instance_profile" "instanceprofile" {
  name = var.profile
  role = aws_iam_role.instance_role.name
}
resource "aws_instance" "global-instance" {
  ami                    = var.amiid
  instance_type          = var.type
  vpc_security_group_ids = ["${aws_security_group.global-sg.id}"]
  subnet_id              = element(tolist(data.aws_subnet_ids.global-subnet1.ids), 0)
  iam_instance_profile   = aws_iam_instance_profile.instanceprofile.name
  tags                   = var.mytag
  depends_on             = [aws_security_group.global-sg]
}
