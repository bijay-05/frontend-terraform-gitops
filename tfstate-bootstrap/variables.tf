variable "default_tags" {
  type = map(string)
  default = {
    Project   = "Intern"
    Creator   = "bijay@gmail.com"
    Deletable = "yes"
  }
}

