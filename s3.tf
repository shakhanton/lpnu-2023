locals {
    env = "local"
}

resource "aws_s3_bucket" "this" {
  bucket = "my-tf-test-bucket-lpnu"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket" "this2" {
  bucket = "my-tf-test-bucket-lpnu-2"
  tags = {
    Name        = "My bucket"
    Environment = local.env
  }
}



module "s3_bucket_frontend" {
  source = "terraform-aws-modules/s3-bucket/aws"
  version = "3.9.0"

  bucket = module.label.id
  # acl    = "private"
  # control_object_ownership = true
  # object_ownership         = "ObjectWriter"

  versioning = {
    enabled = false
  }
} 