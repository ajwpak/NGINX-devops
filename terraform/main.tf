terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-west-1"
}

resource "aws_instance" "site" {
  ami                    = "ami-0d382e80be7ffdae5"
  instance_type          = "t2.micro"
  key_name               = "ajwpakaws-gen-west1"
  vpc_security_group_ids = ["sg-09231cb136f944c71"]
  subnet_id              = "subnet-050b644e891256ec8"

  tags = {
    "name" = "nginx"
  }
}

