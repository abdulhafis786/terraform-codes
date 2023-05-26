provider "aws" {
    region = "us-west-2"
    access_key = "AKIA2UYUIWMS55MMGEP7"
    secret_key = "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"
}

# here we are using toset function along with for_each instad of count as count depends on count index which would mess up
#if there is a new variable added but in toset it does not happen
#count needs to be used where the resources are identical
resource "aws_iam_user" "iam" {
    for_each = toset( ["user-01","user-02","user-03"] )
    name = each.key
}