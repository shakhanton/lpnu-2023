output "app_bucket_id" {
    value = aws_s3_bucket.this.id
}

output "arn" {
    value = aws_s3_bucket.this.arn
}

output "bucket_domain_name" {
    value = aws_s3_bucket.this.bucket_domain_name
}