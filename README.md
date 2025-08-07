# 🌐 Terraform AWS Infrastructure for Testing Application

This repository contains a step-by-step implementation of AWS infrastructure using **Terraform**, following the [DevOps Directive Terraform Course](https://www.youtube.com/watch?v=7xngnjfIlK4). It’s built to support a test web application with modular infrastructure, multi-environment support, and both S3 and Terraform Cloud backends.

---

## 📌 Project Overview

- 💻 **2 EC2 instances** for running the app
- 🌐 **Load Balancer + Route 53** for traffic management and DNS
- ☁️ **Terraform Cloud** and **S3 backends** for state management
- 🧩 Modular structure for reusability
- 🌍 Multiple environments via Terraform Workspaces
- 🔄 CI-ready with developer workflow best practices

---

## 📂 Directory Structure

```bash
.
├── 01-basics/                     # EC2 instances setup
├── 02-aws-backend/               # S3 & DynamoDB remote backend
├── 03-terraform-cloud-backend/   # Terraform Cloud integration
├── 04-web-app/                   # Load Balancer, Route53, web app infra
├── 05-variables-and-output/      # Inputs and outputs with variables.tf
├── 06-web-app/                   # Bug fixes and testing
├── 07-organization-and-modules/  # Refactored into modules
├── 08-managing-multiple-env/     # Workspaces for dev/prod
├── 09-developer-workflow/        # Git-based Terraform workflow
└── .gitignore
````

---

## 🚀 Getting Started

### 1. Clone the Repo

```bash
git clone https://github.com/Yashmaini30/your-repo-name.git
cd your-repo-name
```

### 2. Initialize Terraform

```bash
terraform init
```

### 3. Plan Infrastructure

```bash
terraform plan
```

### 4. Apply Infrastructure

```bash
terraform apply
```

---

## 🧱 Key Modules & Features

* **EC2**: Basic compute resources
* **VPC (optional)**: Private networking (if added in modules)
* **ALB + Route 53**: Load-balanced and DNS-accessible app
* **Terraform Cloud**: Remote state & team collaboration
* **S3/DynamoDB Backend**: State management alternative
* **Variables/Outputs**: Clean and configurable deployments
* **Workspaces**: Separate dev/prod deployments using `terraform workspace`

---

## 🌐 Managing Backends

### ✅ AWS S3 + DynamoDB

```bash
aws s3api create-bucket --bucket your-tf-bucket --region us-east-1

aws dynamodb create-table \
  --table-name terraform-locks \
  --attribute-definitions AttributeName=LockID,AttributeType=S \
  --key-schema AttributeName=LockID,KeyType=HASH \
  --billing-mode PAY_PER_REQUEST
```

### ✅ Terraform Cloud

* Create a workspace at: [Terraform Cloud](https://app.terraform.io/)
* Set required variables/secrets in the workspace settings

---

## 👨‍💻 Developer Workflow

* Separate code per module and environment
* Followed best practices for:

  * Clean directory naming
  * Workspace-based deployments
  * CI/CD readiness

---

## 🙏 Acknowledgements

This project is based on the [DevOps Directive Terraform Course](https://www.youtube.com/watch?v=7xngnjfIlK4). Huge thanks to the creator for the structured and practical content.

