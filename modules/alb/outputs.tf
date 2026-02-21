output "alb_security_group_id" {
    value = aws_security_group.alb_sg.id
}

output "target_group_arn" {
    value = aws_lb_target_group.app_lb_target_group_TS.arn
}

output "alb_dns_name" { 
    description = "our public dns name for the application load balancer"
    value = aws_lb.application_lb_TS.dns_name
}

output "alb_arn" {
    description = "the ARN of the application load balancer, used for WAF association"
    value = aws_lb.application_lb_TS.arn
}

