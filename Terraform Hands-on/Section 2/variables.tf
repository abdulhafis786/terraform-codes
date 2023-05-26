resource "aws_security_group" "var_demo" {
    name = "test-variables"

ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = [var.vpn_ip]
}

ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [var.vpn_ip]
}

ingress {
    from_port = 53
    to_port = 53
    protocol = "tcp"
    cidr_blocks = [var.vpn_ip]
 }
}

#this will force to give only number and not anything else
variable "usernumber" {
    type = number
}

variable "elb_name" {
    type = string
}

variable "az" {
    type = list
}

variable "timeout" {
    type = number
}

variable "iam_names" {
    type = list
    default = ["test-user","stage-user","dev-user","prod-user","dr-user"]
}