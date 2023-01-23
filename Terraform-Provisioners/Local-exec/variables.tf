variable "region" {

  default = "us-east-1"
}

variable "ami" {


  default = "ami-0b5eea76982371e91"
}

variable "instance-type" {

  default = "t2.micro"
}


variable "sg_ports" {

  type        = list(number)
  description = "list of inbound ports"
  default     = [22, 80, 443]

}