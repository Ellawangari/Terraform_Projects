variable "region" {

  default = "us-east-1"
  type    = string
}

locals {

  //formatdate(spec, timestamp) function requires timestamp to be a string
  time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}

variable "instances" {

  type    = list(any)
  default = ["devserver", "stagingserver", "prodserver"]


}

variable "ami" {
  type = map(any)
  default = {

    "us-east-1" = "ami-0a6b2839d44d781b2"
    "us-east-2" = "ami-0cbea92f2377277a4"
    "us-west-1" = "ami-0d4360d9166cfc9cb"
  }

}

variable "instancetype" {

  type    = string
  default = "t2.medium"
}

variable "sg_ports" {

  type        = list(number)
  description = "list of inbound ports"
  default     = [8200, 8000, 8080, 443, 80]

}