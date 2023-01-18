resource "aws_key_pair" "devopskey"{

key_name = "devops-key"
//public key should exist a file within the terraform folder 
public_key = file("${path.module}/id_rsa.pub")


}

resource "aws_instance" "appserver"{
  //loookup retrieves a value from a map given the key , so in our case the 
  //The map is var.ami then the key is var.region
  //if the ke is none existant then it picks the default value
 ami = lookup(var.ami, var.region)
 instance_type = var.instancetype
 key_name = aws_key_pair.devopskey.key_name  
 count = 3
 

 tags = {

//element retrieves a single element from  a list
// element(list,index)
   Name = element(var.instances, count.index)

 }




}