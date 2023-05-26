provider "aws" {
    region = "us-west-2"
    access_key = "AKIA2UYUIWMS55MMGEP7"
    secret_key = "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"
}

/* Here we are giving the instance type as variable and terraform.workspace is because depending on
the workspace chosen, the value of the instance type must change */

resource "aws_instance" "test" {
    ami = "ami-0b029b1931b347543"
    instance_type = lookup(var.instance_type,terraform.workspace)
}

/*Here we are using variable to map the given values to the workspace created.
workspace is created using terraform workspace new <name of the workspace> command */

variable "instance_type" {
    type = map

    default = {
        default = "t2.nano"
        dev = "t2.micro"
        prd = "t2.large"
    }
}
