

// Create an ec2 instance 
resource "aws_instance" "testserver" {

  ami           = "ami-0a6b2839d44d781b2"

  //refencing using maps 
  //instance_type = var.instancetypes["us-west-1"]

  //referencing using list
  instance_type = var.instancelist[2]
     

     // Count parameter to provision 3 ec2 instances
     count = 3 

     //Count.index allows one to give each resource created a specific name unlike using count which makes all the resources have the same name
 

  key_name      = "general"

  tags = {

     Name: "testserver.${count.index}"

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


//Create a security group 

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  # vpc_id      = aws_vpc.main.id
//inbound rules
  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["${aws_eip.testserverip.public_ip}/32"]
  
  }

//Outbound rules
  # egress {
  #   from_port        = 0
  #   to_port          = 0
  #   protocol         = "-1"
  #   cidr_blocks      = ["0.0.0.0/0"]
  #   ipv6_cidr_blocks = ["::/0"]
  # }

  tags = {
    Name = "allow_tls"
  }
}
