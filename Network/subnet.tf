resource "aws_subnet" "public-subnet1" {
  count             = 3
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnet_cidr_[count.index]
  availability_zone = data.aws_availability_zones.all.names[count.index]

  tags {
    Name = "Public Subnet [count.index]"
  }
}

resource "aws_subnet" "private-subnet" {
  count             = 3
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnet_cidr_[count.index]
  availability_zone = data.aws_availability_zones.all.names[count.index]

  tags {
    Name = "Private Subnet [count.index]"
  }
}

data "aws_availability_zones" "all" {}
