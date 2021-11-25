terraform {
   backend "remote" {
     organization = "UnixManCloud"
     workspaces {
       name = "labs-migrate-state"
     }
   }

   required_providers {
      aws = {
        source  = "hashicorp/aws"
        version = "~> 3.27"
      }
   }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "vm" {
  ami           = "ami-04ad2567c9e3d7893"
  subnet_id     = "subnet-04c065ac76f58685c"
  instance_type = "t3.micro"
  tags = {
    Name = "my-first-tf-node"
  }
  count = 2
}
