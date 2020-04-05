provider "aws" {
  version = "~> 2.0"
  region  = "us-east-2"
    access_key = "AKIA5ZO3GBQKKALZOFUH"
     secret_key = "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"
  #shared_credentials_file = "credentials"
  #profile = "access"
}
terraform {
  backend "s3" {
   # shared_credentials_file = "credentials"
    #profile = "access"
    bucket = "terraform-iti"
    key    = "state/state.tfstate"
    region = "us-east-2"
     access_key = "AKIA5ZO3GBQKKALZOFUH"
     secret_key = "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"
  }
}
