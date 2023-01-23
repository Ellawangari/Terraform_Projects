resource "aws_instance" "test-ec2" {
  //creating the instance
  instance_type = var.instance-type
  ami           = var.ami
  //key name
  key_name      = "terraform-prac"

  vpc_security_group_ids = [aws_security_group.allowhttp.id]

  tags = {

    Name = "test-ec2"


  }



 



  provisioner "local-exec" {


 command = "echo ${self.private_ip} >> private_ips.txt"
    
  }


}