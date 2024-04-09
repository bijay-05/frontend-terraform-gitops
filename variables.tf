variable "region" {
  type    = string
  default = "us-east-1"
}

variable "frontend_bucket_name" {
  type    = string
  default = "bijay-frontend-bucket"
}


variable "default_tags" {
  type = map(string)
  default = {
    Project   = "Intern"
    Creator   = "bijay@gmail.com"
    Deletable = "yes"
  }
}

