resource "aws_instance" "test" {
    ami = "ami-0b029b1931b347543"
    instance_type = var.instance_type
}