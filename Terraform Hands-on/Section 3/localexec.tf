provider "aws" {
    region = "us-west-2"
    access_key = "AKIA2UYUIWMS55MMGEP7"
    secret_key = "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"
}

resource "aws_instance" "myec2" {
    ami = "ami-0b029b1931b347543"
    instance_type = "t2.micro"

    provisioner "local-exec" { # here this is locally executed to fetch the private IP address of the instance that is created
        command = "echo ${aws_instance.myec2.private_ip} >> private_ips.txt"
    }
}