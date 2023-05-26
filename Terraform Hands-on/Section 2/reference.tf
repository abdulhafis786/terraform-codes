provider "aws" {
    region = "us-west-2"
    access_key = "AKIA2UYUIWMS55MMGEP7"
    secret_key = "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"
}

resource "aws_instance" "test" {
    ami = "ami-0b029b1931b347543"
    instance_type = "t2.micro"
}

resource "aws_eip" "lb" {
    vpc = true
}

resource "aws_eip_association" "eip_assoc" {
    instance_id = aws_instance.test.id
    allocation_id = aws_eip.lb.id
}

resource "aws_security_group" "allow_tls" {
    name= "allow_tls"

 ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    #the below is the way in which the CIDR block has to be assigned or else it will throw error. This is from version 0.11
    cidr_blocks = ["${aws_eip.lb.public_ip}/32"]
    #cidr_blocks      = [aws_eip.lb.public_ip]
   }
}