resource "aws_vpc" "myvpcpreprod" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_security_group" "preprodsg" {
  name        = "preprodsg"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.myvpcpreprod.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "ssh"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "preprod"
  }
}

resource "aws_internet_gateway" "preprodigw" {
  vpc_id = aws_vpc.myvpcpreprod.id

  tags = {
    Name = "preprodigw"
  }
}

resource "aws_subnet" "preprodsnt" {
  vpc_id     = aws_vpc.myvpcpreprod.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "preprodsnt"
  }
}

resource "aws_route_table" "preprodrt" {
  vpc_id = aws_vpc.myvpcpreprod.id

  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = aws_internet_gateway.preprodigw.id
  }

  tags = {
    Name = "preprodrtable"
  }
}

resource "aws_route_table_association" "preprodrtasso" {
  subnet_id      = aws_subnet.preprodsnt.id
  route_table_id = aws_route_table.preprodrt.id
}
