

resource "aws_instance" "devserver" {

  ami           = "ami-0a6b2839d44d781b2"
  key_name      = "general"

    //Count parameter checks if the boolean expression is true if so the it should create one  dev server
  count = var.istest == true ? 3 :0
  //refencing using maps 
  instance_type = var.instancetypes["us-east-1"]

//Count.index allows one to give each resource created a specific name unlike using count which makes all the resources have the same name
 

  tags = {

       Name = var.instancenames[count.index]
  }
   
   

     


  
}


resource "aws_instance" "prodserver" {

  ami           = "ami-0a6b2839d44d781b2"
  key_name      = "general"

    // Count parameter checks if the boolean expression is false if so then one production server is created
 count = var.istest == false ? 1 :0
  //refencing using maps 
  instance_type = var.instancetypes["us-west-1"]

//Count.index allows one to give each resource created a specific name unlike using count which makes all the resources have the same name
 

  tags = {

       Name = var.instancenames[2]
  }
   
   

     


  
}

