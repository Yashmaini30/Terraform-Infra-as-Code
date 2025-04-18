terraform {
  backend "remote" {
    organization = "practice-terraform"

    workspaces {
      name = "03-terraform-cloud-backend"
    }
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