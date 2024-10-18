terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "sample" {
  ami           = "ami-011899242bb902164"
  instance_type = "t2.micro"    
}