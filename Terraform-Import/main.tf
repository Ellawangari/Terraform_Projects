# resource "aws_instance" "webserver"{

#   instance_type = var.instance_type
#   key_name = var.key_name
#   ami = var.ami



#   tags = {


#     Name = "import-server"
#   }

# }

//provision first eip on the us-east region
resource "aws_eip" "testserverip" {

  vpc = "true"

  tags ={

    Name : "east-eip"
  }
}
//provision first eip on the us-west region
resource "aws_eip" "testserverip2" {

  vpc = "true"
  provider = "aws.west"
  tags ={

    Name : "west-eip"
  }
}