resource "aws_instance" "test-ec2" {
  //creating the instance
  instance_type = var.instance-type
  ami           = var.ami
  key_name      = file("./terraform-prac.pem")
  vpc_security_group_ids = [aws_security_group.allowhttp.id]

  tags = {

    Name = "test-ec2"


  }

  //Provisioner connection

  connection {
    type        = "ssh"
    user        = "root"
    private_key = file("./terraform-prac.pem")
    host        = self.public_ip
  }


  //Provisioner

  provisioner "remote-exec" {
    inline = [
      //Since its an ubuntu instance we want to install nginx and start it
      "sudo apt update",
      "sudo apt install nginx -y "

    ]
  }


}