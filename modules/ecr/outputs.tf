output "repository_url" {
  value = aws_ecr_repository.my_repository.repository_url
}

output "image_uri" {
  value = "${aws_ecr_repository.my_repository.repository_url}:latest"
}