provider "aws" {
  version = "~> 2.0"
  region  = "eu-west-1"
}

#terraform {
#  backend "remote" {
#    hostname      = "app.terraform.io"
#    organization  = "geomidas"
#
#    workspaces {
#      name = "perfin"
#    }
#  }
#}