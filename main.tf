provider "aws" {
  region = "eu-west-2" # London region
}

resource "aws_s3_bucket" "terraform-up-and-running-tcc"{
    bucket = "terraform-up-and-running-tcc"
}

terraform {
  backend "s3" {
    
    bucket         = "terraform-up-and-running-tcc"
    key            = "global/s3/terraform.tfstate"
    region         = "eu-west-2"
  }
}
resource "aws_instance" "test5" {
  ami           = "ami-09e23f0bba0095e44" # Replace with the desired Amazon Linux 2 AMI for eu-west-2 (bitnami image)
  instance_type = "t2.micro"  # Change to the desired instance type
  tags = {
    Name = "devsecops-instance"
  }
}