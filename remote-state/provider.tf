terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.84.0"
    }
  }


  backend "s3" {
    bucket = "hansh-remote-state"
    key    = "ec2-demo"  #you should have unique keys within the bucket , same key should not use in other repos or tf projects
    region = "us-east-1"
    dynamodb_table = "hansh-state-locking"
  }
}


provider "aws" {
  # Configuration options
  region = "us-east-1"
}