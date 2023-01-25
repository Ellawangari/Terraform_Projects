variable "region" {

  default = "us-east-1"
}

variable "ami" {


  default = "ami-0778521d914d23bc1"
}

variable "instance-type" {

  default = "t2.micro"
}

//inbound rules ports
variable "sg_ports" {

  type        = list(number)
  description = "list of inbound ports"
  //ports for ssh, http,https, efs
  default     = [22, 80, 443,2049]

}

//outbound rules port

variable "egress_ports" {

  type        = list(number)
  description = "list of inbound ports"
  default     = [0]

}