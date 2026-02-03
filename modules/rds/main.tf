resource "aws_security_group" "rds_sg_TS" {
    name = "rds-security-group"
    description = "we allow DB access only from our application servers"
    vpc_id = var.vpc_id
    ingress {
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        security_groups = var.app_sg_ids
    }
    egress {
        from_port = 0
        to_port = 0 
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_db_instance" "rds_instance_TS"{
    identifier = "secure-cart-db-instance"
    engine = "mysql"
    engine_version = "8.0"
    instance_class = "db.t4g.micro"
    allocated_storage = 200

    db_name = "SecureCartDB"
    username = var.db_username
    password = var.db_password

    vpc_security_group_ids = [aws_security_group.rds_sg_TS.id]
    db_subnet_group_name = aws_db_subnet_group.this.name 
    multi_az = var.multi_az
    storage_type = "gp3"
    publicly_accessible = false
    skip_final_snapshot = true

    tags = {
        Name = "RDS instance for our SecureCart application"
    }
}


resource "aws_db_subnet_group" "this" { 
        name = "rds-subnet-group"
        subnet_ids = [var.private_subnet_a_id, var.private_subnet_b_id]
}
