resource "aws_instance" "web-ec2" {
  //creating the instance
  instance_type   = var.instance-type
  ami             = var.ami
  key_name        = "terraform-prac"
  security_groups = [aws_security_group.allowhttp.name]

  tags = {

    Name = "web-ec2"


  }




  //Provisioner

  provisioner "local-exec" {




    command = "echo ${self.public_ip} >> public_ip.txt"



  }


}