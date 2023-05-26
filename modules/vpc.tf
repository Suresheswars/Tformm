resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.1.0/24"
}

resource "aws_security_group" "mysg" {
  vpc_id = aws_vpc.myvpc.id
}

resource "" "" {}

 