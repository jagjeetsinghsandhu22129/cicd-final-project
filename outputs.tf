output "s3_website_url" {
  value = aws_s3_bucket.frontend_bucket.website_endpoint
}

output "backend_instance_ip" {
  value = aws_instance.backend_instance.public_ip
}
