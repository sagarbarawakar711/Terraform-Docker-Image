#!/bin/bash

TIMESTAMP=$(date +%Y%m%d%H%M%S)
# Set the ECR repository URL
REPOSITORY_URL="461655781674.dkr.ecr.ca-central-1.amazonaws.com"

# Clean up any possible carriage returns in the repository URL
REPOSITORY_URL=$(echo $REPOSITORY_URL | tr -d '\r')

# Log in to Amazon ECR
echo "Logging in to Amazon ECR..."
aws ecr get-login-password --region ca-central-1 | docker login --username AWS --password-stdin $REPOSITORY_URL

# Build the Docker image from the current directory (.)
echo "Building Docker image..."
docker build -t my-docker-repo .

# Tag the Docker image with the ECR repository URL
echo "Tagging Docker image..."
docker tag my-docker-repo:latest $REPOSITORY_URL/my-docker-repo:$TIMESTAMP

# Push the Docker image to ECR
echo "Pushing Docker image to ECR..."
docker push $REPOSITORY_URL/my-docker-repo:$TIMESTAMP
