provider "aws" {
    region = "us-west-2"
    access_key = "AKIA2UYUIWMS55MMGEP7"
    secret_key = "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"
}

resource "aws_eip" "eip" {
    vpc = true
    depends_on = [null_resource.health_check]
}

# Here the null resource is just to validate the standard lifecycle. only if the curl succeds will the eip be created

resource "null_resource" "health_check" {

    provisioner "local-exec" {

        command = "curl https://google.com"
    }
}