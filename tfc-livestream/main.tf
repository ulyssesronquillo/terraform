terraform {
  required_providers {
    aws = {
      version = ">= 3.22.0"
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  profile = "tfc"
  region  = "us-east-2"
}

resource "aws_instance" "wowza" {
  ami             = "ami-03415be41b64d415f"
  key_name        = "tfc-ohio"
  instance_type   = "c5.2xlarge"
  subnet_id       = "subnet-18b23a70"
  security_groups = ["sg-0a03a540831cc1a0c"]
  private_ip      = "10.0.4.100"
  tags = {
    Name = "Wowza-Streaming-Engine"
  }
}

resource "aws_eip_association" "wowza-eip" {
  instance_id   = aws_instance.wowza.id
  allocation_id = "eipalloc-46aabe68"
}

resource "aws_instance" "switcher" {
  ami             = "ami-0b6470adf2c017ba4"
  key_name        = "tfc-ohio"
  instance_type   = "c5.2xlarge"
  subnet_id       = "subnet-18b23a70"
  security_groups = ["sg-074ebb86f85c80f97"]
  tags = {
    Name = "Cloud-Switcher"
  }
}

resource "aws_eip_association" "switcher-eip" {
  instance_id   = aws_instance.switcher.id
  allocation_id = "eipalloc-36abbf18"
}
