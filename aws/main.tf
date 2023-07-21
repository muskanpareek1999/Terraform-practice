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

/* locals {
	instances = toset(["building","Testing","devlopment","monitoring"])
}*/

locals {
        instances = {"building":"ami-053b0d53c279acc90","Testing":"ami-05548f9cecf47b442","devlopment":"ami-05548f9cecf47b442","monitoring":"ami-053b0d53c279acc90"}
}

resource "aws_instance" "ec2_instance" {
	for_each = local.instances
        ami = each.value
        instance_type = "t2.micro"
        tags = {
                Name = each.key
}
}
