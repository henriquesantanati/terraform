resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Public Route Table"
  }
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "Private Route Table"
  }
}

resource "aws_route_table_association" "route_table_public_link_1" {
  subnet_id      = aws_subnet.public-subnet1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "route_table_public_link_2" {
  subnet_id      = aws_subnet.public-subnet2.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "route_table_public_link_3" {
  subnet_id      = aws_subnet.public-subnet3.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "route_table_private_link_1" {
  subnet_id      = aws_subnet.private-subnet1.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "route_table_private_link_2" {
  subnet_id      = aws_subnet.private-subnet2.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "route_table_private_link_3" {
  subnet_id      = aws_subnet.private-subnet3.id
  route_table_id = aws_route_table.private_route_table.id
}
