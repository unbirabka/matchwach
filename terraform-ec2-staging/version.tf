terraform {
  required_version = ">= 1.0.0"

//  required_providers {
//    aws = {
//      source  = "hashicorp/aws"
//      version = "~> 4.1.0"
//    }
//  }

//  backend "http" {
//    address = "https://gitlab.com/api/v4/projects/12345678/terraform/state/aws-ec2-1"
//    lock_address = "https://gitlab.com/api/v4/projects/12345678/terraform/state/aws-ec2-1/lock"
//    unlock_address = "https://gitlab.com/api/v4/projects/12345678/terraform/state/aws-ec2-1/lock"
//    lock_method = "POST"
//    unlock_method = "DELETE"
//    retry_wait_min = 5
//  }
}

provider "aws" {
  region     = "ap-southeast-1"
  skip_region_validation = true
}
