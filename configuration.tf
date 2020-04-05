provider "aws" {
  version = "~> 2.0"
  region  = "us-east-2"
  shared_credentials_file = "~/.aws/credentials"
  profile = "access"
}
