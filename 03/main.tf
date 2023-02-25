###### variable #####
variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "regions" {
    type = string
    description = "(optional) describe your variable"
}
variable "bucket_name" {
  
}
#####  Provider #####

provider "aws" {
  region     = var.regions
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

##### (Optional) Backend ####

terraform {
  backend "s3" {
    bucket = "lax-tf"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
  }
}

##############################

#####  Resource #####
resource "aws_s3_bucket" "b" {
  bucket = var.bucket_name
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

#####  Output ######

output "mybucket" {
    value = aws_s3_bucket.b.bucket
  
}
