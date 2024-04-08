provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket         = "ishwar-gitops-tf-state-bucket"
    key            = "terraform.ishwar.tfstate"
    region         = "us-east-1"
    dynamodb_table = "ishwar_tf_state"
    encrypt        = true
  }
}


resource "aws_s3_bucket" "frontend-bucket" {
  bucket = var.frontend_bucket_name
  tags = merge(
    var.default_tags,
    {
      "Name" = "ishwar-s3-bucket"
    }
  )

}
