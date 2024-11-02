terraform {
  backend "s3" {
    bucket = "practice-devops-tf-state"
    key    = "08-managing-multiple-env/global/terraform.tfstate"
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

# Route 53 is shared for all environments
resource "aws_route53_zone" "primary" {
  name = "mainiyash.com"
}