provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
    
}
terraform {
  backend "s3" {
    bucket = "terraform-iti"
    key    = "state/state.tfstate"
    region = "us-east-1"
     
  }
}
