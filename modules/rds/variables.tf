variable "db_username" {
    description = "The username for the RDS instance"
    type        = string
}

variable "db_password" {
    description = "The password for the RDS instance"
    type        = string
}

variable "multi_az" {
    description = "specifies if the RDS instance should be multi-AZ"
    type = bool 
}

variable private_subnet_a_id {
    description = "the ID of the private subnet A"
    type = string
}

variable private_subnet_b_id {
    description = "the ID of the private subnet B"
    type = string 
}

variable vpc_id {
    description = "the ID of the VPC where our RDS will be deployed"
    type = string
}

variable app_sg_ids {
    description = "the security groups that are allowed to access our RDS"
    type = list(string)
}