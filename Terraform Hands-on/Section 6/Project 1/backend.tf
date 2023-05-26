terraform {
    backend "s3" {
        bucket = "ami-0b029b1931b347543"
        key  = "network/terraform.tfstate" #path where the tfstate file has to be stored
        region = "us-west-2"
        #Here the access key and secret key have to be provided for the terraform to authenticate the bucket
        access_key = "AKIA2UYUIWMS55MMGEP7"
        secret_key = "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"
    }
}