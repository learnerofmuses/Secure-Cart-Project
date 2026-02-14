#ROOT MODULE: variables.tf

#EC2 Variables
variable "bastion_ami_id" {
    description = "our AMI ID for the bastion host"
    type = string
}

variable "secure_cart_ami_id" {
    description = "our AMI ID for the secure-cart application server"
    type = string
}
variable "bastion_instance_type_id" {
    description = "our instance type for the bastion host"
    type = string 
    default = "t2.micro"
}

variable "secure_cart_instance_type_id" {
    description = "our instance type for the secure-cart application server"
    type = string
    default = "t2.micro"
}

variable "key_name" {
    description = "The key pair name for SSH access"
    type = string
}
#RDS Variables
variable "db_username" {
    description = "The username for the RDS instance"
    type        = string
    sensitive = true
}

variable "db_password" {
    description = "The password for the RDS instance"
    type        = string
    sensitive = true
}

variable "multi_az" {
    description = "specifies if the RDS instance should be multi-AZ"
    type = bool 
}


#ALB Variables