# 🚀 Terraform-Provisioned AWS ECS (Fargate) Deployment

This project demonstrates a **production-style containerized application deployment on AWS**, fully provisioned using **Terraform** and running on **Amazon ECS (Fargate)** behind an **Application Load Balancer (ALB)**.

It focuses on **Infrastructure as Code, cloud-native architecture, security, observability, and safe teardown**, reflecting how modern systems are actually built and operated.

---

## 🔍 Project Overview

The goal of this project is to deploy a **Dockerized Python Flask application** on AWS using a **serverless container architecture**, without managing EC2 instances manually.

All infrastructure is:

- Defined using Terraform
- Version-controlled
- Reproducible
- Safely destroyed after validation to avoid AWS costs

---

## 🧠 What This Project Demonstrates

- Infrastructure as Code using **Terraform**
- Containerized application delivery with **Docker**
- Serverless containers using **Amazon ECS (Fargate)**
- Secure networking using **Application Load Balancer**
- Health-check-based traffic routing
- IAM role separation (Execution Role vs Task Role)
- CloudWatch logging and observability
- Debugging real production-style issues
- Responsible cloud resource cleanup

---

## 🏗 Architecture Summary

### Provisioning (via Terraform)

Terraform provisions the following AWS resources:

- Amazon ECR (container registry)
- ECS Cluster (Fargate)
- ECS Task Definition
- ECS Service
- Application Load Balancer
- Target Group & Listener
- Security Groups
- IAM Roles & Policies
- CloudWatch Log Group

Terraform is used **only for provisioning** and does not handle application code or container builds.

---

### Runtime Flow

1. Docker image is built locally
2. Image is pushed to Amazon ECR
3. ECS Service pulls the image from ECR
4. ECS Tasks run on Fargate
5. ALB routes HTTP traffic (port 80) to containers (port 5000)
6. Health checks are performed using `/health`

📌 ECS never accesses source code directly — it only pulls container images from ECR.

---

## ⚙️ Application Details

- **Framework:** Python Flask
- **Endpoints:**
  - `/` → Application response
  - `/health` → Health check (HTTP 200)
- **Container Port:** 5000
- **Runtime:** ECS Fargate

---

## 🔐 Security & Networking

- ALB allows inbound HTTP traffic on port **80**
- ECS tasks accept traffic **only from the ALB**
- No direct public access to containers
- IAM Execution Role:
  - Pulls images from ECR
  - Writes logs to CloudWatch
- IAM Task Role:
  - Reserved for application permissions (future-ready)

---

## 🚀 Deployment Workflow

1. Infrastructure provisioned using Terraform
2. Docker image built locally
3. Image pushed to Amazon ECR
4. ECS Service launches tasks
5. ALB performs health checks and routes traffic
6. Application becomes accessible via ALB DNS

---

## 🧪 Real-World Issues Debugged

This project involved resolving real operational issues, including:

- ECS tasks failing due to missing ECR image tags
- IAM permission issues blocking image pulls
- ALB returning 503 due to unhealthy targets
- Container startup failures
- Terraform state vs configuration mismatches
- Safe deletion of non-empty ECR repositories

---

## 🧹 Cleanup & Cost Control

All AWS resources can be removed safely using:

```bash
terraform destroy
```
