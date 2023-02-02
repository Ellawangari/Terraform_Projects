variable "region" {


  default = "us-east-1"


}

variable "key_name" {

  description = "Key name"
  type        = string

}

variable "instance-type" {

  description = "Instance types"
  type        = string


  

}


variable "ami" {

  description = "AMI"
  type        = string

}