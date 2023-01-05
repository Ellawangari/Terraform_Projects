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
  //instance = aws_instance.testserver.id


  // vpc = true indicates that the eip is for use in vpc
  vpc = "true"

  tags ={

    Name : "testservereip"
  }
}

//Second way to associate eip with an ec2 instance is by using the  aws_eip_association resource
//So create the eip first then associate it with the instance .Benefit of using this option is that it allows one to use pre existing elastic ips  that cannot be changed

resource "aws_eip_association" "demo-eip" {
 
 //id of the instance
 instance_id = aws_instance.testserver.id

 //id of the eip
 allocation_id = aws_eip.testserverip.id

}


//Output the eip public address on the terminal

output "eip" {

  value = aws_eip.testserverip.public_ip

}



