variable "vpc_id" {
    description = "our VPC ID where the resources will be created"
    type = string
}

variable "bastion_instance_type_id" {
    description = "our instance type for the bastion host"
    type = string
}

variable "bastion_ami_id" {
    description = "our AMI ID for the bastion host"
    type = string
}

variable "bastion_sg_id" {
    description = "our security group ID for the bastion host"
    type = string
}

variable "secure_cart_instance_type_id" {
    description = "our instance type for the secure-cart application server"
    type = string
    
}

variable "secure_cart_ami_id" {
    description = "our AMI ID for the secure-cart application server"
    type = string
}

variable "secure_cart_app_sg_id" {
    description = "our security group ID for the secure-cart application server"
    type = string
}

variable "public_subnet_id" {
    description = "our public subnet ID"
    type = string
}

variable "private_subnet_id" {
    description = "our private subnet ID"
    type = string
}

variable "key_name" {
    description = "our key pair name for SSH access"
    type = string
}

variable "db_host" {
    description = "the RDS instance endpoint"
    type = string
}

variable "db_port" {
    description = "the RDS instance port"
    type = number
}