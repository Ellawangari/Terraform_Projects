terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      //provider version 
      version = "~>4.16"

    }
  }
  // terraform version
  required_version = ">=0.12"
}

//first region
provider "aws" {

  region = var.region

}
//second region 
provider "aws" {

//using alias allows us to provide two provider configurations
  alias = "west"
  region = var.aliasregion

  //to use a diffrent account profile to launch eip one has to have two access key both configure on aws cli and use their profile name to launch resources

  profile = "account-02"

}