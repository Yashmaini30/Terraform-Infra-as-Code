terraform {
  backend "s3" {
    bucket = "practice-devops-tf-state"
    key    = "08-managing-multiple-env/workspaces/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-state-locking"
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

variable "db_pass" {
  description = "password for database"
  type = string
  sensitive = true
}

locals {
  environment_name = terraform.workspace
}

module "web_app" {
  source = "../../07-organization-and-modules/web-app-module"

  # Input variables
  bucket_prefix    = "web-app-data-${local.environment_name}"
  domain           = "mainiyash.com"
  environment_name = local.environment_name
  instance_type    = "t2.micro"
  create_dns_zone  = terraform.workspace == "production" ? true : false
  db_name          = "${local.environment_name}mydb"
  db_user          = "foo"
  db_pass          = var.db_pass
}