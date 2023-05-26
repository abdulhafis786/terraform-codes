provider "aws" {
    region = "us-west-2"
    access_key = "AKIA2UYUIWMS55MMGEP7"
    secret_key = "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"
}

# Here we have not defined the cidr block so the creation provisioner will fail as it is not able to connect to the internet
resource "aws_security_group" "allow_ssh" {
    name = "allow_ssh"
    description = "  Allow inbound SSH traffic"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

}

resource "aws_instance" "myec2" {
    ami = "ami-0b029b1931b347543"
    instance_type = "t2.micro"
    key_name = "terraform"
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]

    #this is a creation time provisioner
    provisioner "remote-exec" {
        on_failure =  continue # this is the on-failure condition which based on the value mentioned will either fail or continue to provision
        inline = [
            "sudo yum -y install nano"
        ]
    }

    #this is a destroy-time provisioner.when we give destroy, it will first remove the package and only then it will delete the instance
    provisioner "remote-exec" {
        when = destroy
        inline = [
            "sudo yum -y remove nano"
        ]
    }

    connection {
        type = "ssh"
        user = "ec2-user"
        private_key = file("./terraform.pem")
        host = self.public_ip
    }
}