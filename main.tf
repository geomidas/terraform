provider "aws" {
  version = "~> 2.0"
  region  = "eu-west-1"
}

resource "aws_default_vpc" "default" {}
