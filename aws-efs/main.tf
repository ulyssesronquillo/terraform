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

resource "aws_efs_file_system" "efs-test" {
   creation_token = "efs-test"
   performance_mode = "generalPurpose"
   throughput_mode = "bursting"
   encrypted = "true"
 tags = {
     Name = "efs-test"
   }
}

resource "aws_efs_mount_target" "efs-mt-example" {
   file_system_id  = aws_efs_file_system.efs-test.id
   subnet_id = "subnet-0f5c2aa3c56ca736d"
   security_groups = ["sg-04b356aadbe0afa78"]
}
