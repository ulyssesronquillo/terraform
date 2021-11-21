terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_spot_instance_request" "jekyll" {
  ami                           = "ami-0255a333b8a1d9009"
  spot_price                    = "0.0031"
  wait_for_fulfillment          = "true"
  key_name                      = "servers"
  instance_type                 = "t3.micro"
  subnet_id                     = "subnet-0f5c2aa3c56ca736d"
  security_groups               = ["sg-04b356aadbe0afa78"]
  associate_public_ip_address   = "true"
  user_data = <<-EOF
              #!/bin/bash
              hostnamectl set-hostname jekyll
              EOF
  tags = {
        Name = "jekyll-0.3"
  }
}

resource "aws_ec2_tag" "tagging" {
  resource_id                   = aws_spot_instance_request.jekyll.spot_instance_id
  key                           = "Name"
  value                         = "jekyll-0.3"
}
