resource "aws_eip" "myeip1" {
    vpc = true
}

resource "aws_eip" "myeip2" {
    vpc = true
    provider = "aws.mumbai" # Since we want the resource to be created in second region we specify it with the alias name
}