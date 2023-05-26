provider "aws" {
    region = "us-west-2"
    access_key = "AKIA2UYUIWMS55MMGEP7"
    secret_key = "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"
}

resource "aws_instance" "test" {
    ami = "ami-0b029b1931b347543"
    instance_type = "t2.micro"
}

terraform {
    required_providers{
        digitalocean = {
            source = "digitalocean/digitalocean"
        }
    }
}

provider "digitalocean" {}