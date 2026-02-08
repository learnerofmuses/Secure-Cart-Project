output "vpc_id"{
    description = "The ID of the VPC"
    value       = aws_vpc.vpc_TS.id
}

output "public_subnet_a_id" { 
    value = aws_subnet.public_sub_A.id
}

output "public_subnet_b_id" {
    value = aws_subnet.public_sub_B.id
}

output "private_subnet_a_id" {
  value = aws_subnet.private_sub_A.id
}

output "private_subnet_b_id" {
    value = aws_subnet.private_sub_B.id
}

output "internet_gateway_id" {
    description = "the id of our internet gateway which attaches to our vpc and allows communication between the internet and our vpc"
    value = aws_internet_gateway.igw_TS.id
}

