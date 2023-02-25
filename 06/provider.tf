#####  Provider #####

provider "aws" {
  region     = var.regions
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}


terraform {
  backend "s3" {
    bucket = "lax-tf"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
  }
}
