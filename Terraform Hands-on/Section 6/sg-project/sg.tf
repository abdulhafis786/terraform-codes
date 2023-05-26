provider "aws" {
    region = "us-west-2"
    access_key = "AKIA2UYUIWMS55MMGEP7"
    secret_key = "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"
}

resource "aws_security_group" "allow_tls" {
    name = "allow_tls"
    description = "Allow TLS inbound traffic"

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    /*the below cidr value collects the output value from the state file created by the network project
    and how it refers to that bucket is by the definition given in the remote-state.tf file */
    cidr_blocks       = ["${data.terraform_remote_state.eip.outputs.eip_addr}/32"]
}

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}