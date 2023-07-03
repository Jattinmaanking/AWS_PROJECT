# use to create main VPC 

resource "aws_vpc" "main-vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"

  tags = {
    Name = "main-vpc"
  }
}

#1) to create publc subnet inside the main vpc

resource "aws_subnet" "main-public" {
  vpc_id                  = aws_vpc.main-vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1a"

  tags = {
    Name = "main-public-us-east-1a"
  }
}

# 2) to create privite subnet in main vpc

resource "aws_subnet" "main-private-1" {
  vpc_id                  = aws_vpc.main-vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-1b"

  tags = {
    Name = "main-private-us-east-1b"
  }
}

# 3) to create privite subnet 2 in main vpc

resource "aws_subnet" "main-private-2" {
  vpc_id                  = aws_vpc.main-vpc.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-1c"

  tags = {
    Name = "main-private-us-east-1c"
  }
}


# 4) to create privite 3 subnet in main vpc

resource "aws_subnet" "main-private-3" {
  vpc_id                  = aws_vpc.main-vpc.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-1d"

  tags = {
    Name = "main-private-us-east-1d"
  }
}

# to create internet gatway so public subnet get internet access and become actual public subnet

resource "aws_internet_gateway" "public-gw" {
  vpc_id = aws_vpc.main-vpc.id

  tags = {
    Name = "public-gw"
  }
}

# Creating route table for the public subnet

resource "aws_route_table" "public-route" {
  vpc_id = aws_vpc.main-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.public-gw.id
  }


  tags = {
    Name = "public-route"
  }
}


# link route table for the public subnet

resource "aws_route_table_association" "public-route-1a" {
  subnet_id      = aws_subnet.main-public.id
  route_table_id = aws_route_table.public-route.id
}
