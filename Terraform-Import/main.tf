resource "aws_instance" "webserver"{

  instance_type = var.instance_type
  key_name = var.key_name
  ami = var.jenkinsami
   vpc_security_group_ids = "sg-0d192e9fb3eb83421"


  tags = {


    Name = "terraformimport-server"
  }

}