module "bucket" {
    source = "./modules/s3"
    s3_bucket_name = var.bucket_name 
}

module "appServer" {
    source = "./modules/ec2"
    instace_type = "t3.micro"
}