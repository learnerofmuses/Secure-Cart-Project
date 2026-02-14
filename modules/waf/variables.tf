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

