module "bucket" {
    source = "./modules/s3"
    s3_bucket_name = var.bucket_name 
}

module "bucket02" {
    source = "./modules/s3"
    s3_bucket_name = var.bucket_name02
}