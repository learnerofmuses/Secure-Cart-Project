output "vpc_id"{
    description = "The ID of the VPC"
    value       = aws_vpc.vpc_TS.id
}

output "public_subnet_id" { 
    value = aws_subnet.public_subnet.id
}

output "private_subnet_a_id" {
  value = aws_subnet.private_sub_a.id
}

output "private_subnet_b_id" {
    value = aws_subnet.private_sub_b.id
}


#we created a separate IGW module for better modularity along with the routing tables 