provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket         = "bijay-tfstate-bucket"
    key            = "terraform.bijay.tfstate"
    region         = "us-east-1"
    dynamodb_table = "bijay_tfstate_table"
    encrypt        = true
  }
}


resource "aws_s3_bucket" "frontend-bucket" {
  bucket = var.frontend_bucket_name
  tags = merge(
    var.default_tags,
    {
      "Name" = "bijay-frontend-bucket"
    }
  )

}
