provider "aws" {
  region = "us-east-1"
}

# Define the S3 Bucket
resource "aws_s3_bucket" "frontend_bucket" {
  bucket = "ci-cd-frontend-bucket-unique-id"
}

# Define the ACL for the S3 Bucket
resource "aws_s3_bucket_acl" "frontend_bucket_acl" {
  bucket = aws_s3_bucket.frontend_bucket.id
  acl    = "public-read"
}

# Define the Website Configuration for the S3 Bucket
resource "aws_s3_bucket_website_configuration" "frontend_bucket_website" {
  bucket          = aws_s3_bucket.frontend_bucket.id
  index_document {
    suffix = "index.html"
  }
}


resource "aws_instance" "backend_instance" {
  ami           = "ami-0c55b159cbfafe1f0" # Use valid AMI ID
  instance_type = "t2.micro"
  key_name      = var.key_name

  tags = {
    Name = "BackendInstance"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y python3",
      "pip3 install flask flask-cors",
      "python3 -m flask run --host=0.0.0.0"
    ]
  }
}

resource "aws_api_gateway_rest_api" "backend_api" {
  name = "BackendAPI"
}
