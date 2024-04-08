provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "tf_backend_bucket" {
  bucket = "bijay-tfstate-bucket"
  tags = merge(
    var.default_tags,
    {
      "Name" = "bijay-tfstate-bucket"
    }
  )

}

resource "aws_s3_bucket_versioning" "tf_backend_bucket_versioning" {
  bucket = aws_s3_bucket.tf_backend_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_object_lock_configuration" "tf_backend_bucket_object_lock_configuration" {
  depends_on          = [aws_s3_bucket.tf_backend_bucket]
  bucket              = aws_s3_bucket.tf_backend_bucket.id
  object_lock_enabled = "Enabled"
}



resource "aws_s3_bucket_server_side_encryption_configuration" "tf_backend_bucket_server_side_encryption_config" {
  bucket = aws_s3_bucket.tf_backend_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "aws:kms"
    }
  }
}

resource "aws_dynamodb_table" "tf_state_table" {
  name           = "bijay_tfstate_table"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
  tags = merge(
    var.default_tags,
    {
      "Name" = "bijay_tfstate_table"
    }
  )
}