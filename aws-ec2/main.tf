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

resource "aws_spot_instance_request" "rtmp-server" {
  ami                           = "ami-09e67e426f25ce0d7"
  spot_price                    = "0.0031"
  wait_for_fulfillment          = "true"
  key_name                      = "servers"
  instance_type                 = "t3.micro"
  subnet_id                     = "subnet-0f5c2aa3c56ca736d"
  security_groups               = ["sg-04b356aadbe0afa78"]
  associate_public_ip_address   = "true"
  user_data = <<-EOF
              #!/bin/bash
              hostnamectl set-hostname nginx-rtmp
              EOF
  tags = {
        Name = "nginx-rtmp-0.1"
  }
}

resource "aws_ec2_tag" "tagging" {
  resource_id                   = aws_spot_instance_request.rtmp-server.spot_instance_id
  key                           = "Name"
  value                         = "nginx-rtmp-0.1"
}
