
resource "aws_instance" "testserver"{
 instance_type = var. instancetype
 key_name = "general"
 ami = data.aws_ami.app-ami.id 

 tags ={
 
 Name ="test-server"

 }


}