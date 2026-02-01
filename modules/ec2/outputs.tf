output "vpc_id" {
  value = var.vpc_id
}


#Bastion host outputs

output "bastion_instance_id" {
  description = "the ID of the Bastion EC2 instance"
  value = aws_instance.bastion_instance.id
}
output "bastion_public_ip"{
    description = "the public IP address of the Bastion EC2 instance"
    value = aws_instance.bastion_instance.public_ip
}

output "bastion_security_group_id" {
  description = "the security group ID of the Bastion EC2 instance"
  value = var.bastion_sg_id
}

#Secure-Cart app server outputs 

output "secure_cart_app_instance_id" {
  description = "the ID of the secure-cart application EC2 instance"
  value = aws_instance.secure_cart_app_instance.id
}

output "secure_cart_app_private_ip" {
    description = "the private IP address of the secure-cart application EC2 instance"
    value = aws_instance.secure_cart_app_instance.private_ip
}

output "secure_cart_app_security_group_id" {
  description = "the security group ID of the secure-cart application EC2 instance"
  value = var.secure_cart_app_sg_id
}