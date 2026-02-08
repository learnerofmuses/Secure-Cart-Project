resource "aws_vpc" "vpc_TS" {
  cidr_block = var.vpc_cidr #sets our cidr block for our vpc 
  enable_dns_support = true #enables dns resolution within the vpc 
  enable_dns_hostnames = true #allows instances launched within the vpc to have dns hostnames 

  tags = {
    Name = "SecureCart app VPC"
  }
}

resource "aws_subnet" "public_sub_A" {
  vpc_id = aws_vpc.vpc_TS.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
}

resource "aws_subnet" "public_sub_B" {
  vpc_id = aws_vpc.vpc_TS.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"
}

resource "aws_subnet" "private_sub_A" {
  vpc_id = aws_vpc.vpc_TS.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "SecureCart app private subnet A"
  }
}

resource "aws_subnet" "private_sub_B" {
  vpc_id = aws_vpc.vpc_TS.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "SecureCart app private subnet B"
  }
}

resource "aws_internet_gateway" "igw_TS" {
  vpc_id = aws_vpc.vpc_TS.id

  tags = { 
    name = "securecart app igw"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc_TS.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_TS.id
  }

  tags = { 
    name = "our public route table which makes our public subnets public by routing traffic to the internet gateway"
  }
}

resource "aws_route_table_association" "public_sub_a_assoc" {
  subnet_id = aws_subnet.public_sub_A.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_sub_b_assoc" {
  subnet_id = aws_subnet.public_sub_B.id
  route_table_id = aws_route_table.public_rt.id
}
