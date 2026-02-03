output "db_instance_endpoint" { 
    description = "endpoint of the RDS instance"
    value = aws_db_instance.rds_instance_TS.endpoint
}

output "db_port" {
    description = "port of the RDS instance"
    value = aws_db_instance.rds_instance_TS.port
}

output "db_name" {
    description = "name of the database"
    value = aws_db_instance.rds_instance_TS.db_name
}

output "db_instance_id" {
    description = "ID of the RDS instance" 
    value = aws_db_instance.rds_instance_TS.id
}

