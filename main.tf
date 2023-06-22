terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.18.0"
    }
  }

  backend "s3" {
    bucket         	   = "tf-state-bucket-1234556"
    key                = "state/terraform.tfstate"
    region         	   = "us-east-1"
    encrypt        	   = true
    dynamodb_table     = "tf-state-dynamo-db"
  }
}

resource "aws_instance" "example" {
  ami           = "ami-022e1a32d3f742bd8"
  instance_type = "t2.micro"
}