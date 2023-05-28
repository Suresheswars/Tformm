resource "aws_vpc" "global_vpc" {
  cidr_block           = var.cidr
  enable_dns_hostnames = true
  tags                 = var.mytag
}

resource "aws_subnet" "global_pub" {
  count             = length(var.public_subnet)
  cidr_block        = element(var.public_subnet, count.index)
  availability_zone = element(var.az, count.index)
  vpc_id            = aws_vpc.global_vpc.id
  depends_on        = [aws_vpc.global_vpc]
  tags = {
    Name = "public"
  }
}

resource "aws_subnet" "global_pri" {
  count             = length(var.private_subnet)
  cidr_block        = element(var.private_subnet, count.index)
  availability_zone = element(var.az, count.index)
  vpc_id            = aws_vpc.global_vpc.id
  depends_on        = [aws_vpc.global_vpc]
  tags = {
    Name = "private"
  }
}

data "aws_subnet_ids" "global-subnet1" {
  vpc_id = aws_vpc.global_vpc.id
  tags = {
    Name = "public"
  }
}

data "aws_subnet_ids" "global-subnet2" {
  vpc_id = aws_vpc.global_vpc.id
  tags = {
    Name = "private"
  }
}

resource "aws_internet_gateway" "global_igw" {
  vpc_id = aws_vpc.global_vpc.id
  tags   = var.mytag
}

resource "aws_route_table" "global_pubrt" {
  vpc_id = aws_vpc.global_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.global_igw.id
  }
}

resource "aws_route_table_association" "global_pubrtass1" {
  count          = length(data.aws_subnet_ids.global-subnet1)
  route_table_id = aws_route_table.global_pubrt.id
  subnet_id      = element(tolist(data.aws_subnet_ids.global-subnet1.ids), count.index)
  depends_on     = [aws_subnet.global_pub, aws_subnet.global_pri]
}

resource "aws_eip" "global_eip1" {
  vpc = true
}

resource "aws_nat_gateway" "global_ngw" {
  #count         = length(data.aws_subnet_ids.global-subnet1)
  subnet_id     = element(tolist(data.aws_subnet_ids.global-subnet1.ids), 0)
  allocation_id = aws_eip.global_eip1.id
}

resource "aws_route_table" "global_prirt" {
  vpc_id = aws_vpc.global_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.global_ngw.id
  }
}

resource "aws_route_table_association" "global_priass1" {
  count          = length(data.aws_subnet_ids.global-subnet2.ids)
  route_table_id = aws_route_table.global_prirt.id
  subnet_id      = element(tolist(data.aws_subnet_ids.global-subnet2.ids), count.index)
  depends_on     = [aws_subnet.global_pub, aws_subnet.global_pri]
}


