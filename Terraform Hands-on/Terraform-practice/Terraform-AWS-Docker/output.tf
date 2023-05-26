output "instance_state" {
    description = "State of the instance"
    value = aws_instance.test.instance_state
}

output "instance_id" {
    description = "ID of the instance"
    value = aws_instance.test.id
}

output "public_ip" {
    description = "Public IP of the instance"
    value = aws_instance.test.public_ip
}