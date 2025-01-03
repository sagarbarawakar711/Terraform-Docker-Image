variable "ecr_repository_url" {
  description = "The URL of the ECR repository"
}

variable "aws_region" {
  description = "The AWS region to deploy to"
  default     = "ca-central-1"  
}