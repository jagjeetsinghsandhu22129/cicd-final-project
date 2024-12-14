variable "key_name" {
  description = "Name of the key pair for EC2 instances"
}

variable "aws_region" {
  description = "AWS region to deploy resources"
  default     = "us-east-1"
}
