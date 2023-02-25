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


#####  Resource #####
resource "aws_s3_bucket" "b" {
  bucket = var.bucket_name
 versioning {
    enabled = true
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
