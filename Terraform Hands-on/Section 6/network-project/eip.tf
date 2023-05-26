provider "aws" {
    region = "us-west-2"
    access_key = "AKIA2UYUIWMS55MMGEP7"
    secret_key = "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"
}

resource "aws_eip" "lb" {
    vpc = true
}

output "eip_addr" {
    value = aws_eip.lb.public_ip
}

terraform { 
    backend "s3" {
        bucket = "ami-0b029b1931b347543"
        key = "network/eip.tfstate"
        region = "us-west-2"
        access_key = "AKIA2UYUIWMS55MMGEP7"
        secret_key = "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" 
    }
}