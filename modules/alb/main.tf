resource "aws_security_group" "alb_sg" {
    name = "alb_security_group"
    description = "security group for our application load balancer"
    vpc_id = var.vpc_id

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_lb" "application_lb_TS" {
    name = var.name 
    internal = false
    load_balancer_type = "application"
    security_groups = [aws_security_group.alb_sg.id]
    subnets = var.public_subnet_ids

    tags = {
        Name = "Secure-Cart-Application-LB"
    }
}

resource "aws_lb_target_group" "app_lb_target_group_TS" {
    name = "SecureCart-app-tg"
    port = 8080
    protocol = "HTTP"
    vpc_id = var.vpc_id 

    health_check { 
        path = "/health"
        interval = 30 
        timeout = 5
        healthy_threshold = 2
        unhealthy_threshold = 3
        matcher = "200"
    }
}

resource "aws_lb_listener" "http" {
    load_balancer_arn = aws_lb.application_lb_TS.arn
    port = 80 
    protocol = "HTTP"

    default_action {
        type = "forward"
        target_group_arn = aws_lb_target_group.app_lb_target_group_TS.arn
    }
}