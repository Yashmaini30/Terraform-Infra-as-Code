terraform {
  backend "s3" {
    bucket         = "practice-devops-tf-state"
    key            = "06-web-app/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-locking"
    encrypt        = true
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

## REPO: https://github.com/hashicorp/terraform-aws-consul

module "consul" {
  source = "git@github.com:hashicorp/terraform-aws-consul.git"
}
