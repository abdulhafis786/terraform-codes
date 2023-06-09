provider "aws" {
    access_key = var.aws_access_key
    secret_key = var.aws_secret_key
    region = var.aws_region
}

#here we are using datasources to query the data. have to get additional information on this

data "aws_availability_zones" "available" {
    state = "available"
}

resource "aws_vpc" "vpc" {
    cidr_block = var.aws_vpc
    enable_dns_hostnames = true

    tags = local.common_tag
}

resource "aws_internet_gateway" "ig" {
    vpc_id = aws_vpc.vpc.id

    tags = local.common_tag
}

resource "aws_subnet" "subnet1" {
    vpc_id = aws_vpc.vpc.id
    # Since we are trying to create two subnets we are calling the first one in the list using 0 
    cidr_block = var.aws_subnets[0]
    map_public_ip_on_launch = true
    # Here we are using the data variable to check the list of available zone
    availability_zone = data.aws_availability_zones.available.names[0]

    tags = local.common_tag
}

resource "aws_subnet" "subnet2" {
    vpc_id = aws_vpc.vpc.id
    # Since we are trying to create two subnets we are calling the second one in the list using 1
    cidr_block = var.aws_subnets[1]
    map_public_ip_on_launch = true
    # Here we are using the data variable to check the list of available zone
    availability_zone = data.aws_availability_zones.available.names[1]

    tags = local.common_tag
}

resource "aws_route_table" "rtb" {
    vpc_id = aws_vpc.vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.ig.id
    }

    tags = local.common_tag
}

resource "aws_route_table_association" "rta_subnet1" {
    subnet_id = aws_subnet.subnet1.id
    route_table_id = aws_route_table.rtb.id
}

resource "aws_route_table_association" "rta_subnet2" {
    subnet_id = aws_subnet.subnet2.id
    route_table_id = aws_route_table.rtb.id
}

resource "aws_security_group" "nginx-sg" {
    name = "nginx-sg"
    vpc_id = aws_vpc.vpc.id

    ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.aws_vpc] # Here we are referencing the variable as we are setting a front end Load balancer
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = local.common_tag
}

resource "aws_security_group" "alb_sg" {
    name = "nginx-alb-sg"
    vpc_id = aws_vpc.vpc.id

    ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = local.common_tag
}
