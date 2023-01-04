// Create an ec2 instance 
resource "aws_instance" "testserver" {

  ami           = "ami-0a6b2839d44d781b2"
  instance_type = "t2.micro"
  key_name      = "general"

  tags = {

     Name: "testserver"

     }
}


//Create an elastic ip and associate it with the instance

resource "aws_eip" "testserverip" {
  //First way to  Associate the eip to the instance created
  instance = aws_instance.testserver.id


  // vpc = true indicates that the eip is for use in vpc
  vpc = "true"

  tags ={

    Name : "testservereip"
  }
}

//Second way to associate eip with an ec2 istance is by using the  aws_eip_association resource


//Output the eip public address

output "eip" {

  value = aws_eip.testserverip.id

}



