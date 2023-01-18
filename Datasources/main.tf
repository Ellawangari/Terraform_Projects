data "aws_ami" "app-ami" {

most_recent = true
owners =["amazon"]
filter {

  name = "name"
  values = ["amzn2-ami-hvm*"]

}

}


resource "aws_instance" "testserver"{
 instance_type = var. instancetype
 key_name = "general"
 ami = data.aws_ami.app-ami.id 

 tags ={
 
 Name ="test-server"

 }


}