output "s3_bucket_arn" {
  value       = aws_s3_bucket.frontend-bucket.arn
  description = "ARN of S3 bucket"
}

output "s3_bucket_id" {
  value       = aws_s3_bucket.frontend-bucket.id
  description = "ID of S3 bucket"
}

output "s3_bucket_name" {
  value       = aws_s3_bucket.frontend-bucket.bucket
  description = "Name of S3 bucket"
}