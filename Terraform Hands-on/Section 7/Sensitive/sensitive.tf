provider "aws" {
    region = "us-west-2"
    access_key = "AKIA2UYUIWMS55MMGEP7"
    secret_key = "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"
}

locals {
    db_password = {
        admin = "password"
    }
}

output "db_password" {
    value = local.db_password
    sensitive = true #Here the sensitive parameter masks the output displayed
}