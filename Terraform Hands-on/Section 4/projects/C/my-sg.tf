module "sgmodule" {
  source = "../../modules/outputsg"
}

resource "aws_instance" "web" {
  ami           = "ami-0b029b1931b347543"
  instance_type = "t3.micro"
  vpc_security_group_ids = [module.sgmodule.sg_id]
}