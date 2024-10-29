variable "region" {
    description = "aws region"
    type = string
    default = "us-east-1"
}

#EC2 variables

variable "ami" {
  description = "Amazon machine image to use for ec2 instance"
  type        = string
  default     = "ami-011899242bb902164"
}

variable "instance_type" {
  description = "ec2 instance type"
  type        = string  
  default     = "t2.micro"
}   

# S3

variable "bucket_prefix" {
  description = "prefix for s3 bucket"
  type = string
}

# Route 53

variable "domain" {
  description = "domain name"  
  type = string
}

# RDS Variables

variable "db_name" {
  description = "Name of DB"
  type        = string
}

variable "db_user" {
  description = "Username for DB"
  type        = string
}

variable "db_pass" {
  description = "Password for DB"
  type        = string
  sensitive   = true
}