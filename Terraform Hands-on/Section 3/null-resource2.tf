provider "aws" {
    region = "us-west-2"
    access_key = "AKIA2UYUIWMS55MMGEP7"
    secret_key = "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"
}

resource "aws_eip" "eip" {
    vpc = true
    count = 1
}

resource "null_resource" "ip_check" {
    /* The trigger is a map of arbitary string that when changed allows the null resource to rerun again.
    What it means from this example if the count is changed to 5, there will be 5 IPs created and all of them
    will be recorded in the sample.txt file. This will happen only if there is trigger in place.
    Join function is basically to join the list of output obtained.
    */
    triggers = {
        latest_ips = join(",",aws_eip.eip[*].public_ip)
    }

    provisioner "local-exec" {

        command = " echo Latest IPs are ${null_resource.ip_check.triggers.latest_ips} > sample.txt"
    }
}