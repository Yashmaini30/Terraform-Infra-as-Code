terraform {
  # we already have  s3 and dynamodb
  backend "s3" {
    bucket = "terraform-state"
    key    = "04-web-app/terraform.tfstate"
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

resource "aws-instance" "instance_1" {
  ami           = "ami-011899242bb902164"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.instance.name]
  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World 1" > index.html
              python3 -m http.server 8080 &
              EOF
}

resource "aws_instance" "instance_2" {
  ami           = "ami-011899242bb902164"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.instance.name]
  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World 2" > index.html
              python3 -m http.server 8080 &
              EOF
}

resource "aws_s3_bucket" "bucket" {
  bucket_prefix = "yash-bucket-web-app"
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "bucket_versioning" {   
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = "Enabled"
  } 
}

resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_crypto_conf" {
  bucket = aws_s3_bucket.bucket.bucket
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}