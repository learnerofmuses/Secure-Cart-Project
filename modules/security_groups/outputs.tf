output "bastion_sg_id" {
    description = "The ID of the Bastion Host Security Group"
    value       = aws_security_group.bastion_sg.id
}

output "secure_cart_app_sg_id" {
    description = "The ID of the Secure Cart Application Server Security Group"
    value       = aws_security_group.SCapp_sg.id
}