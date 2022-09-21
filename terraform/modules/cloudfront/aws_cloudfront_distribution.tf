resource "aws_cloudfront_distribution" "cloudfront" {
  default_cache_behavior {
    allowed_methods        = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cache_policy_id        = data.aws_cloudfront_cache_policy.CachingDisabled.id
    cached_methods         = ["GET", "HEAD"]
    compress               = "true"
    default_ttl            = "0"
    max_ttl                = "0"
    min_ttl                = "0"
    smooth_streaming       = "false"
    target_origin_id       = format("%s.execute-api.%s.amazonaws.com",var.aws_api_gateway_rest_api_tfer_campaign_rest_id,var.region)
    viewer_protocol_policy = "redirect-to-https"
  }

  enabled         = "true"
  http_version    = "http2"
  is_ipv6_enabled = "true"

  origin {
    connection_attempts = "3"
    connection_timeout  = "10"

    custom_origin_config {
      http_port                = "80"
      https_port               = "443"
      origin_keepalive_timeout = "5"
      origin_protocol_policy   = "https-only"
      origin_read_timeout      = "30"
      origin_ssl_protocols     = ["TLSv1.2"]
    }

    domain_name = format("%s.execute-api.%s.amazonaws.com",var.aws_api_gateway_rest_api_tfer_campaign_rest_id,var.region)
    origin_id   = format("%s.execute-api.%s.amazonaws.com",var.aws_api_gateway_rest_api_tfer_campaign_rest_id,var.region)
    origin_path = "/test"
  }

  price_class = "PriceClass_All"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  retain_on_delete = "false"

  viewer_certificate {
    cloudfront_default_certificate = "true"
    minimum_protocol_version       = "TLSv1"
  }
}

data "aws_cloudfront_cache_policy" "CachingDisabled" {
  name = "Managed-CachingDisabled"
}

