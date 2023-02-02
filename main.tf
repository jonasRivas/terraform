terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  access_key = var.my_access_key 
  secret_key = var.my_secret_key 
  region  = "eu-west-1"
}

locals {
  setup_name = "tuts"
}

resource "aws_vpc" "main" {
  cidr_block = "10.5.0.0/16"

  tags = {
    Name = "${local.setup_name}-vpc"
    foo = local.setup_name
  }
}

resource "aws_subnet" "web" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.5.0.0/16"

  tags = {
    Name = "${local.setup_name}-subnet"
  }
}

resource "aws_instance" "web" {
  ami           = "ami-0333305f9719618c7"
  instance_type = var.my_instance_type 

  tags = {
    Name = "${local.setup_name}-ExampleFromTerraform"
  }
}

output "intance_ip" {
  value = aws_instance.web.public_ip
}

