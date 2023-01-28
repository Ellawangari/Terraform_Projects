resource "aws_instance" "jenkinsec2"{

  instance_type = var.instancetype
  key_name = var.key_name
  ami = var.jenkinsami

  tags = {


    Name = "Jenkins-Server"
  }

}
resource "aws_instance" "artifactoryec2"{

  instance_type = var.instancetype
  key_name =  var.key_name
  ami = var.artifactoryami

  tags = {


    Name = "Artifactory-Server"
  }

}