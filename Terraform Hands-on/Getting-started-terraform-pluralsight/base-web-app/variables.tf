variable "aws_access_key" {
    type = string
    sensitive = true
}

variable "aws_secret_key" {
    type = string
    sensitive = true
}

variable "aws_region" {
    type = string
    default = "us-west-1"
}

variable "aws_vpc" {
    default = "10.0.0.0/16"
}

#Here we are using the collective variable along with primitive variable
variable "aws_subnets" {
    type = list(string)
    default = ["10.0.0.0/24","10.0.1.0/24"]
}

variable "instance_type" {
    default = "t2.micro"
}

variable "company" {
    type = string
    default = "Globomantics"
}

variable "project" {
    type = string
}

variable "billing_code" {
    type = string
}