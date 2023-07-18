terraform {
        required_providers {
        aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
}
}
required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ec2_instance" {
	count = 2
        ami = "ami-053b0d53c279acc90"
        instance_type = "t2.micro"
        tags = {
                Name = "Terraform_instance"
}
}

output "ec2_public_ip" {
	value = aws_instance.ec2_instance[*].public_ip
}

resource "aws_s3_bucket" "mybucket" {
  bucket = "jack-bucket23"

  tags = {
    Name        = "jack-bucket23"
    Environment = "Dev"
  }
}
