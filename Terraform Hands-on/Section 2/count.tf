provider "aws" {
    region = "us-west-2"
    access_key = "AKIA2UYUIWMS55MMGEP7"
    secret_key = "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"
}

resource "aws_instance" "instance-1" {
    ami = "ami-0b029b1931b347543"
    instance_type = "t2.micro"
    count = 3
}

variable "iam_names" {
    type = list
    default = ["test","stage","dev","prod","dr"]
}

#This will create unique names rather than common names for everyone but the names will have appending numbers
#iorder to have unique names without any number we have to iterate the count index to the variable defined above
resource "aws_iam_user" "test" {
    name = var.iam_names[count.index]
    count = 5
    path = "/system/"
}