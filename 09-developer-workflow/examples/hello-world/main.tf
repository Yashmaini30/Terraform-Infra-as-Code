terraform {
  backend "s3" {
    bucket = "practice-devops-tf-state"
    key    = "09-developer-workflow/hello-world/terraform.tfstate"
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

module "web_app" {
  source = "../../modules/hello-world"
}

output "instance_ip_addr" {
  value = module.web_app.instance_ip_addr
}

output "url" {
  value = "http://${module.web_app.instance_ip_addr}:8080"
}