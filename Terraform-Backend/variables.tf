variable "region" {


  default = "us-east-1"


}

variable "key_name" {

  description = "Key name"
  type        = string

}

variable "instance-type" {

  description = "Instance types"
  type        = map

  default = {

    default = "t2.micro",
    dev = "t2.medium",
    prod = "t2.large"
  }

}


variable "jenkinsami" {

  description = "Jenkins AMI"
  type        = string

}