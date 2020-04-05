provider "aws" {
  version = "~> 2.0"
  region  = "us-east-2"
  shared_credentials_file = "~/.aws/credentials"
  profile = "access"
}
terraform {
  backend "s3" {
    shared_credentials_file = "~/.aws/credentials"
    profile = "access"
    bucket = "terraform-iti"
    key    = "state/state.tfstate"
    region = "us-east-2"
  }
}
