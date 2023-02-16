resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.vorx-vpc-prod.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "prod-public-rt"
  }
}

 

resource "aws_route_table_association" "pub-rt-1a-associate" {
  subnet_id      = aws_subnet.vorx-subnet-pub-1a.id
  route_table_id = aws_route_table.public-rt.id
}

 

resource "aws_route_table_association" "pub-rt-1b-associate" {
  subnet_id      = aws_subnet.vorx-subnet-pub-1b.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table" "private-rt-1a" {
  vpc_id = aws_vpc.vorx-vpc-prod.id

  tags = {
    Name = "prod-private-rt-1a"
  }
}

resource "aws_route_table" "private-rt-1b" {
  vpc_id = aws_vpc.vorx-vpc-prod.id

  tags = {
    Name = "prod-private-rt-1b"
  }
}

resource "aws_route_table_association" "priv-rt-1a-associate" {
  subnet_id      = aws_subnet.vorx-subnet-priv-1a.id
  route_table_id = aws_route_table.private-rt-1a.id
}

resource "aws_route_table_association" "priv-rt-1b-associate" {
  subnet_id      = aws_subnet.vorx-subnet-priv-1b.id
  route_table_id = aws_route_table.private-rt-1b.id
}
