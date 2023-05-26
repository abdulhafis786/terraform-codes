provider "aws" {
    region = "us-west-2"
    access_key = "AKIA2UYUIWMS55MMGEP7"
    secret_key = "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"
}

resource "aws_iam_user" "lb" {
    name = "loadbalancer"
    path  = "/system/"
}

resource "aws_instance" "myec2" {
    ami = "ami-0b029b1931b347543"
    instance_type = "t2.micro"
}

terraform { 
    backend "s3" {
        bucket = "ami-0b029b1931b347543"
        key = "network/demo.tfstate"
        region = "us-west-2"
        access_key = "AKIA2UYUIWMS55MMGEP7"
        secret_key = "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"
    }
}