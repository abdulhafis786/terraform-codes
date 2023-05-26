provider "aws" {
    region = "us-west-2"
    access_key = "AKIA2UYUIWMS55MMGEP7"
    secret_key = "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"
}

resource "aws_instance" "dev" {
    ami = "ami-0b029b1931b347543"
    instance_type = "t2.micro"
    count = var.is_test == true ? 1 : 0
}

resource "aws_instance" "prod" {
    ami = "ami-0b029b1931b347543"
    instance_type = "t2.large"
    count = var.is_test == false ? 1 : 0
}

# The value of true/false would be specified in terraform.tfvars 
variable "is_test" {}