terraform {
  backend "s3" {
    bucket = "terraform-state"
    key    = "05-variables-and-output/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-state-lock"
    encrypt = true
  }

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

locals {
  extra_tags = "extra_tags"
}

resource "aws_instance" "instance_1" {
  ami           = var.ami
  instance_type = var.instance_type
  tags = {
    Name = var.instance_name
    Extra = local.extra_tags
  }
}

resource "aws_db_instance" "db_instance" {
  allocated_storage = 20
  storage_type = "gp2"
  engine = "postgres"
  engine_version = "14"
  instance_class = "db.t3.micro"
  username = var.db_user
  password = var.db_pass
  skip_final_snapshot = true
}