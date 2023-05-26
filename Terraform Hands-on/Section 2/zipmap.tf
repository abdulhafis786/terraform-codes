provider "aws" {
    region = "us-west-2"
    access_key = "AKIA2UYUIWMS55MMGEP7"
    secret_key = "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"
}


resource "aws_iam_user" "test" {
    name = "iamuser.${count.index}"
    count = 3
    path = "/system/"
}

output "arns" {
    value = aws_iam_user.test[*].arn
}

output "name" {
    value = aws_iam_user.test[*].name
}

#here the zipmap function is used to combine the two values and provide it as a single one. It constructs a map from a list of keys and a corresponding list of values.
output "combined" {
    value = zipmap(aws_iam_user.test[*].arn,aws_iam_user.test[*].name)
}