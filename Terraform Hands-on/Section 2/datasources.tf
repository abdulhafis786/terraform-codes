provider "aws" {
    region = "us-west-2"
    access_key = "AKIA2UYUIWMS55MMGEP7"
    secret_key = "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"
}

#here the datasource is given so that we dont have to hardcode value in this case of the ami value and it will automatically take it from the specified Vendor
data "aws_ami" "app_ami" {
    most_recent = true
    owners = ["amazon"]

    filter {
        name = "name"
        values = ["amzn2-ami-hvm*"]
    }
}

resource "aws_instance" "test_instance" { 
    ami = data.aws_ami.app_ami.id
    instance_type = "t2.micro"
}