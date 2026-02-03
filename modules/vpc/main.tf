resource "aws_vpc" "vpc_TS" {
  cidr_block = var.vpc_cidr #sets our cidr block for our vpc 
  enable_dns_support = true #enables dns resolution within the vpc 
  enable_dns_hostnames = true #allows instances launched within the vpc to have dns hostnames 

  tags = {
    Name = "SecureCart app VPC"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.vpc_TS.id
  cidr_block = "10.0.1.0/24"
}

resource "aws_subnet" "private_sub_a" {
  vpc_id = aws_vpc.vpc_TS.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "SecureCart private subnet A"
  }
}

resource "aws_subnet" "private_sub_b" {
  vpc_id = aws_vpc.vpc_TS.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "SecureCart private subnet B"
  }
}