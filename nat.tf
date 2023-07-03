/* elastic ip for NAT */

resource "aws_eip" "nat_eip" {
  vpc = "true"

  depends_on = [aws_internet_gateway.public-gw]

  tags = {
    Name = "NAT elastic IP"
  }

}

# create nat gateway and link ELastic IP

resource "aws_nat_gateway" "nat" {

  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.main-public.id

  tags = {
    Name = "gw NAT"
  }
}

resource "aws_route_table" "private_rt1" {
  vpc_id = aws_vpc.main-vpc.id

  route {

    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id

  }

  tags = {
    Name = "Private route table 1"
  }

}

resource "aws_route_table_association" "main-private1" {
  subnet_id      = aws_subnet.main-private-1.id
  route_table_id = aws_route_table.private_rt1.id
}


resource "aws_route_table" "private_rt2" {
  vpc_id = aws_vpc.main-vpc.id

  route {

    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id

  }

  tags = {
    Name = "Private route table 2"
  }

}

resource "aws_route_table_association" "main-private-2" {
  subnet_id      = aws_subnet.main-private-2.id
  route_table_id = aws_route_table.private_rt2.id
}