###### variable #####
variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "regions" {
  
}
variable "bucket_name" {
  
}
variable "no_of_buckets" {
  
}
#####  Provider #####

provider "aws" {
  region     = var.regions
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}


#####  Resource #####
resource "aws_s3_bucket" "b" {
  count = var.no_of_buckets
  bucket = "${var.bucket_name}-${count.index}"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}


#####  Output ######

output "mybucket" {
    
    value = aws_s3_bucket.b[*].bucket
  
}
