// Create an ec2 instance 
resource "aws_instance" "testserver" {

  ami           = "ami-0a6b2839d44d781b2"
  instance_type = "t2.micro"
  key_name      = "general"

}


//Create an elastic ip and asociate it with the instance

resource "aws_eip" "testserverip" {
  // Associate the eip to the instance created
  //instance_id = aws_instance.testserver.id
  // vpc = true indicates that the eip is for use in vpc
  vpc = "true"
}

//Output the eip public address

output "eip" {

  value = aws_eip.testserverip.id

}



