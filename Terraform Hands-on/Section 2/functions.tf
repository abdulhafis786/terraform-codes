provider "aws" {
  region     = var.region
  access_key = "YOUR-ACCESS-KEY"
  secret_key = "YOUR-SECRET-KEY"
}

#here the formatdate and timestamp funtion has been used simultaneously to display the date in correct format
locals {
  time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}

variable "region" {
  default = "ap-south-1"
}

variable "tags" {
  type = list
  default = ["firstec2","secondec2"]
}

variable "ami" {
  type = map
  default = {
    "us-east-1" = "ami-0323c3dd2da7fb37d"
    "us-west-2" = "ami-0d6621c01e8c2de2c"
    "ap-south-1" = "ami-0470e33cd681b2476"
  }
}

resource "aws_key_pair" "loginkey" {
  key_name   = "login-key"
  #here the file function is just to display the contents of the file that is mentioned.The path module is the path where the terraform file is hosted
  public_key = file("${path.module}/id_rsa.pub")
}

resource "aws_instance" "app-dev" {
   #lookup retrieves the value of a single element from a map, given its key. If the given key does not exist, the given default value is returned instead.
   # syntax lookup(map, key, default)
   ami = lookup(var.ami,var.region)
   instance_type = "t2.micro"
   key_name = aws_key_pair.loginkey.key_name
   count = 2

   tags = {
    #element retrieves a single element from a list. Syntax element(list, index)
     Name = element(var.tags,count.index)
   }
}


output "timestamp" {
  value = local.time
}