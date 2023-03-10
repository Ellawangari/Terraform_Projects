variable "region" {

  default = "us-east-1"
}

variable "ami" {

  //ubuntu instance ami
  //default = "ami-0778521d914d23bc1"

  //RHEL8 instance ami
  default = "ami-06640050dc3f556bb"


}

variable "instance-type" {

  default = "t2.micro"
}

//inbound rules ports for public sg
variable "sg_ports" {

  type        = list(number)
  description = "list of inbound ports"
  //ports for ssh, http
  default = [22, 80]

}

//inbound rules ports for private sg
variable "privatesg_ports" {

  type        = list(number)
  description = "rds port"
  //ports for ssh, http
  default = [3306]

}

//outbound rules port

variable "egress_ports" {

  type        = list(number)
  description = "list of outbound ports"
  default     = [0]

}


