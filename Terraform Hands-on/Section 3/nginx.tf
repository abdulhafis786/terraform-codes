provider "aws" {
    region = "us-west-2"
    access_key = "AKIA2UYUIWMS55MMGEP7"
    secret_key = "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"
}

resource "aws_instance" "myec2" {
    ami = "ami-0b029b1931b347543"
    instance_type = "t2.micro"
    key_name = "terraform" # This is the name of the key that was given during manual generation

    connection {
        type = "ssh"
        user = "ec2-user"
        private_key = file("./terraform.pem") #this was manually generated which will be used to connect.amazon AMI needs a private key to connect
        host = self.public_ip
    }

  provisioner "remote-exec" { #provisioner for remote execution
    inline = [
        "sudo amazon-linux-extras install -y nginx1 ",
        "sudo systemctl start nginx"
    ]
  }
}