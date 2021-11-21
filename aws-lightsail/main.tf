terraform {
  required_providers {
    aws = {
      version = ">= 3.22.0"
      source = "hashicorp/aws"
    }
  }
}



provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_lightsail_instance" "linux" {
  name               = "linux"
  availability_zone  = "us-east-1a"
  blueprint_id       = "amazon_linux_2"
  bundle_id          = "nano_2_0"
  ipv6_address_count = 0
  tags               = {
    name="linux" 
    version="0.1"
  }
}

output "public_ip" {
  value = aws_lightsail_instance.linux.public_ip_address
}

