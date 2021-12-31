terraform {
  required_providers {
    aws = {
      version = ">= 3.22.0"
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_lightsail_instance" "linux" {
  name              = "linux"
  availability_zone = "us-east-1a"
  blueprint_id      = "amazon_linux_2"
  bundle_id         = "micro_2_0"
  tags = {
    name    = "linux"
    version = "0.1"
  }
}

resource "aws_lightsail_instance_public_ports" "test" {
  instance_name = aws_lightsail_instance.linux.name

  port_info {
    protocol  = "tcp"
    from_port = 22
    to_port   = 22
    cidrs     = ["0.0.0.0/0"]
  }

  port_info {
    protocol  = "tcp"
    from_port = 80
    to_port   = 80
    cidrs     = ["0.0.0.0/0"]
  }
  port_info {
    protocol  = "tcp"
    from_port = 443
    to_port   = 443
    cidrs     = ["0.0.0.0/0"]
  }

}

output "public_ip" {
  value = aws_lightsail_instance.linux.public_ip_address
}

