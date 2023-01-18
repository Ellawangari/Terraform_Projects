terraform {

 required_providers {

   source  = "hashicorp/aws"
   //provider version
   version = "~>4.16"

}
 //terraform version
 required_version = ">=0.12"
}

provider "aws" {

  region = "var.region"

}