variable "region" {

  default = "us-east-1"
}

variable "ami" {


  default = "ami-0a6b2839d44d781b2"
}

variable "instance-type" {

  default = "t2.micro"
}


variable "sg_ports" {

  type        = list(number)
  description = "list of inbound ports"
  default     = [80, 443]

}