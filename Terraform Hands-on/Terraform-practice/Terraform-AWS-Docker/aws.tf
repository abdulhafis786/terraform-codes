terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = " ~>4.16"
        }
    }
}

provider "aws" {
    access_key = var.access_key
    secret_key = var.secret_key
    region = var.region
}

resource "aws_instance" "test" {
    ami = "ami-0b029b1931b347543"
    instance_type = "t2.micro"

    tags = {
        Name = var.instance_name
    }
}