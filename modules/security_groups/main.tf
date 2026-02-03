# bastion host security group 

resource "aws_security_group" "bastion_sg"{
    name = "Bastion-SG"
    description = "Security group for Bastion Host"
    vpc_id = var.vpc_id

    ingress{
        description = "allows inbound ssh access"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        description = "allows all outbound traffic"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
#application server security group
resource "aws_security_group" "SCapp_sg"{
    name = "Secure Cart App SG"
    description = "Security group for secure-cart application servers - allows HTTP traffic from bastion host"
    vpc_id = var.vpc_id

    ingress{
        description = "allows inbound traffic from bastion host"
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
    }

    egress {
        description = "allows all outbound traffic"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
