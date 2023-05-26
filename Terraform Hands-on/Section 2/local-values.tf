provider "aws" {
    region = "us-west-2"
    access_key = "AKIA2UYUIWMS55MMGEP7"
    secret_key = "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"
}

locals {
    common_tags = {
        Owner = "Devops team"
        service = "Backend"
    }
}

resource "aws_instance" "app-dev" {
    ami = "ami-0b029b1931b347543"
    instance_type = "t2.micro"
    tags = local.common_tags
}

resource "aws_instance" "db-dev" {
    ami = "ami-0b029b1931b347543"
    instance_type = "t2.small"
    tags = local.common_tags
}

resource "aws_ebs_volume" "db_ebs" {
    availability_zone = "us-west-2a"
    size = 8
    tags = local.common_tags
}