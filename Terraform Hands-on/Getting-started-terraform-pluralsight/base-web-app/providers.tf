terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
 /*  here we are adding another provider under required providers block. Always note that 
 only the name of the provider has to be added not the entire block */

    random = {
      source = "hashicorp/random"
      version = "~> 3.0"
    }
  
  }
}

provider "aws" {
    access_key = var.aws_access_key
    secret_key = var.aws_secret_key
    region = var.aws_region
}