provider "aws" {
    access_key = "AKIA2UYUIWMS55MMGEP7"
    secret_key = "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"
    region = "us-west-2"
}

resource "aws_eip" "testeip" {
    vpc = true
}

output "eip" {
    value = aws_eip.testeip
}

resource "aws_s3_bucket" "mybucket" {
    bucket = "test-aws-bucket-001"
}

output "s3bucketname" {
    value = aws_s3_bucket.mybucket
}