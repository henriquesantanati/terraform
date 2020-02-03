data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "public-subnet[count.index]" {
  count             = 3
  vpc_id            = aws_vpc.main.id
  cidr_block        = "var.public_subnet_cidr_[count.index]"
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "Public Subnet [count.index]"
  }
}

resource "aws_subnet" "private-subnet[count.index]" {
  count             = 3
  vpc_id            = aws_vpc.main.id
  cidr_block        = "var.private_subnet_cidr_[count.index]"
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "Private Subnet [count.index]"
  }
}