provider "aws" {
    region = "us-west-2"
    access_key = "AKIA2UYUIWMS55MMGEP7"
    secret_key = "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"
}

/* Here the below resource configuration is done as per manually created configuration */

resource "aws_instance" "test" {
    ami = "ami-0df24e148fdb9f1d8"
    instance_type = "t2.micro"
    vpc_security_group_ids = ["sg-0c9a6f77df04f76ab"] /* Here the security group should be mentioned
                                                        as list hence square braces */
    key_name = "terraform"

    tags = {
        Name = "Ec2 server" 
    }
}