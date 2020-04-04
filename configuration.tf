provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
  # access_key = "AKIAJAJDFVTR72IZZK5A"
  # secret_key = "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"
  shared_credentials_file = "credentials"
  profile = "access"
}
terraform {
  backend "s3" {
    shared_credentials_file = "credentials"
    profile = "access"
    bucket = "terraform-iti"
    key    = "state/state.tfstate"
    region = "us-east-1"
    # access_key = "AKIAJAJDFVTR72IZZK5A"
    # secret_key = "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"
  }
}
