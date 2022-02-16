terraform {
    cloud {
        organization = "jpmmota"
        workspaces {
            name = "Example-Workspace"
        }
    }

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
  region  = "ca-central-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-040d8c460f4fc4a9f"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}
