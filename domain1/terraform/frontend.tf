module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "~> 4.0"

  bucket        = module.label.id
  force_destroy = true

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

module "cloudfront" {
  source  = "terraform-aws-modules/cloudfront/aws"
  version = "~> 3.0"

  origin = {
    s3 = {
      domain_name           = module.s3_bucket.s3_bucket_bucket_regional_domain_name
      origin_access_control = "s3"
    }
  }

  default_root_object         = "index.html"
  price_class                 = "PriceClass_100"
  viewer_protocol_policy      = "redirect-to-https"
  minimum_protocol_version    = "TLSv1.2_2021"
}
