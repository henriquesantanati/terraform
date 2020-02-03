resource "aws_security_group" "sg_application" {
  name        = "SG_Application"
  description = "Allow incoming HTTP/HTTPS connections & SSH access"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = -1
    self      = true
  }

  vpc_id = aws_vpc.main.id

  tags {
    Name = "SG Application"
  }
}

# Define the security group for private subnet
resource "aws_security_group" "sg_rds" {
  name        = "SG_RDS"
  description = "Allow traffic from public subnet"

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = -1
    security_groups = aws_security_group.sg_application.id
  }

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = -1
    self      = true
  }

  vpc_id = aws_vpc.main.id

  tags {
    Name = "SG RDS"
  }
}
