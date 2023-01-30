resource "aws_instance" "jenkinsec2"{

  instance_type = lookup(var.instance-type,terraform.workspace)
  key_name = var.key_name
  ami = var.jenkinsami


  tags = {


    Name = "Jenkins-Server"
  }

}