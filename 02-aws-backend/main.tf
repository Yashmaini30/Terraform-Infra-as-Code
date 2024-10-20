terraform {
    backend "s3" {
        bucket = "terraform-state"
        key    = "02-aws-backend/terraform.tfstate"
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

resource "aws_s3_bucket" "terraform_state" {
    bucket = "terraform-state"
    force_destroy = true

    tags = {
        Name = "Terraform state"
    }
  
}

resource "aws_s3_bucket_versioning" "terraform_bucket_versioning" {
    bucket = aws_s3_bucket.terraform_state.id
    versioning_configuration {
        status = "Enabled"
    }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state_encryption_configuration" {
    bucket = aws_s3_bucket.terraform_state.bucket
    rule {
        apply_server_side_encryption_by_default {
            sse_algorithm = "AES256"
        }
    } 
}

resource "aws_dynamodb_table" "terraform_state_lock" {
    name = "terraform-state-lock"
    hash_key = "LockID"
    billing_mode = "PROVISIONED"
    table_class = "STANDARD"

    attribute {
        name = "LockID"
        type = "S"
    }
  
}