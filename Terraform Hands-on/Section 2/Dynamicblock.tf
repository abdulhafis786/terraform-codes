variable "sg_ports" {
    type = list(number) #here our list is numbers
    default = [8200,8201,8300,9200,9500]
}

resource "aws_security_group" "dynamicsg" {
    name = "dynamic-sg"
    description = "ingress for vault"
    
    #here we are defining the dynamic content so that we do not need to repeat the code again and again
    dynamic "ingress" {
        for_each = var.sg_ports
        iterator = port # this is an optional parameter but the reason its mentioned here is to give a clarity on what value needs to be provided
        content {
            from_port = port.value 
            to_port = port.value #here if the iterator value is not provided it will take the dynamic label which in this case is ingress
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
}