provider "aws" {
    region = "us-west-2"
    access_key = "AKIA2UYUIWMS55MMGEP7"
    secret_key = "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"
}

# here the foreach function is used to implement different resources instead of using the count parameter.
resource "aws_instance" "myec2" {
    ami = "ami-0b029b1931b347543"
    for_each = {
        key1 = "t2.micro"
        key2 = "t2.small"
    }
    instance_type = each.value
    key_name = each.key
    tags = {
        Name = each.value 
    }
}