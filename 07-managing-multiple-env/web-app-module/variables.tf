# general variable

variable "region" {
    description = "aws region"
    type = string
    default = "us-east-1"   
}

variable "app_name" {
  description = "value for app_name"
  type = string
  default = "web-app"
}

variable "environment_name" {
  description = "Deployment environment (dev/staging/production)"
  type        = string
  default     = "dev"
}

# EC2 Variables

variable "ami" {
  description = "Amazon machine image to use for ec2 instance"
  type        = string
  default     = "ami-011899242bb902164" # Ubuntu 20.04 LTS // us-east-1
}

variable "instance_type" {
  description = "ec2 instance type"
  type        = string
  default     = "t2.micro"
}

# RDS varaibles 

variable "db_user" {   
  description = "username for database" 
  type        = string
  default     = "foo"
}

variable "db_pass" {
  description = "password for database"                 
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "name for database"
  type = string
}

# Route53 variables

variable "create_dns_zone" {
  description = "create dns zone"
  type = bool
  default = true
}

variable "domain" {
  description = "domain name"
  type = string
  default = "mainiyash.com"
}

# S3 variables

variable "bucket_prefix" {
  description = "prefix for s3 bucket"
  type = string
}