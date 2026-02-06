variable "vpc_id" {
    description =" the VPC ID where our ALB will be created"
    type = string
}

variable "name" {
    description = "the name of the application load balancer"
    type = string
}

variable "public_subnet_ids" {
    description = "a list of public subnet IDs where the ALB will be deployed"
    type = list(string)
}