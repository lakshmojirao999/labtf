resource "aws_s3_bucket" "b" {
  bucket = var.s3_bucket_name
 versioning {
    enabled = true
  }
  lifecycle_rule {
    id      = "log"
    enabled = true

    prefix = "log/"

    tags = {
      rule      = "log"
      autoclean = "true"
    }

    transition {
      days          = 30
      storage_class = "STANDARD_IA" # or "ONEZONE_IA"
    }

    transition {
      days          = 60
      storage_class = "GLACIER"
    }

    expiration {
      days = 90
    }
  }  
 tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
