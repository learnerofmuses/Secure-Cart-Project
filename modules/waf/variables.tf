variable "scope" {
    description = "The scope of the WAF. Valid values are 'CLOUDFRONT' or 'REGIONAL'."
    type        = string
    default     = "REGIONAL"
}

variable "metric_name" {
    description = "The name of our CloudWatch metric to be associated with the WAF."
    type        = string
    default     = "SecureCartWAFMetric"
}

variable "alb_arn" {
    description = "the ARN of the ALB to associate with the WAF"
    type = string
}