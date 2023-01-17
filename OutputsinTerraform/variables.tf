variable "region" {

  default = "us-east-1"
  type = string
}

variable "instancetypes"{

  type = map
  
  default = {
 
   us-east-1 = "t2.micro"
   us-west-1 ="t2.nano"
  

  }
}

variable "instancelist"{

type = list
default = ["us-east-1", "us-west-1", "eu-central-1"]

}

