terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.16"

    }
  }

  required_version = ">=0.12"
}

provider "aws" {

  region = var.region

}