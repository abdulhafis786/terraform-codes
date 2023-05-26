output "aws_public_ip" {
    value = aws_lb.nginx.dns_name
}