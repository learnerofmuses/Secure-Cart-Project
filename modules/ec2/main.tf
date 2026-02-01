
# bastion host instance
resource "aws_instance" "bastion_instance" {
    ami = var.bastion_ami_id
    instance_type = var.bastion_instance_type_id
    subnet_id = var.public_subnet_id
    key_name = var.key_name
    vpc_security_group_ids = [var.bastion_sg_id]
    tags = {
        Name = "bastion host instance"
    }
}

#our secure-cart application server instance
resource "aws_instance" "secure_cart_app_instance" {
    ami = var.secure_cart_ami_id
    instance_type = var.secure_cart_instance_type_id
    subnet_id = var.private_subnet_id
    key_name = var.key_name
    vpc_security_group_ids = [var.secure_cart_app_sg_id]
    tags = {
        Name = "application server instance"
    }
    depends_on = [aws_instance.bastion_instance]
}