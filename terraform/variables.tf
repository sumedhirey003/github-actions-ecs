variable "aws_region" {
  description = "AWS region to deploy resources into"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Project name prefix for resources"
  type        = string
  default     = "github-actions-ecs-cicd"
}

variable "image_tag" {
  description = "Docker image tag to deploy"
  type        = string
}