resource "aws_wafv2_web_acl" "SecureCart_waf" {
    name = "SecureCart-WAF"
    scope = var.scope 
    default_action {
        allow {}
    }

    visibility_config {
        cloudwatch_metrics_enabled = true 
        metric_name = var.metric_name
        sampled_requests_enabled = true
    }

    rule {
        name = "AWS-AWSManagedRulesCommonRuleSet"
        priority = 1
        override_action {
            none {}
        }
        statement {
            managed_rule_group_statement {
                name = "AWSManagedRulesCommonRuleSet"
                vendor_name = "AWS"
            }
        }
        visibility_config {
            cloudwatch_metrics_enabled = true
            metric_name = "AWS-AWSManagedRulesCommonRuleSet"
            sampled_requests_enabled = true
        }
    }
}

resource "aws_wafv2_web_acl_association" "SecureCart_waf_association" {
    resource_arn = module.alb.alb_arn
    web_acl_arn = aws_wafv2_web_acl.SecureCart_waf.arn
}