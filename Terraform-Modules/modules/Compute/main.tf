module "Security" {

  source         = "../Security"


 

}


resource "aws_instance" "jenkinsec2"{

  instance_type = var.instance-type
  key_name = var.key_name
  ami = var.jenkinsami
 vpc_security_group_ids = [module.Security.sg_id]

  tags = {


    Name = "Jenkins-Server"
  }

}
resource "aws_instance" "artifactoryec2"{

  instance_type = var.instance-type
  key_name =  var.key_name
  ami = var.artifactoryami
  vpc_security_group_ids = [module.Security.sg_id]
  tags = {


    Name = "Artifactory-Server"
  }

}