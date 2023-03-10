//Launch RDS 

resource "aws_db_instance" "Database" {


  allocated_storage      = 20
  max_allocated_storage  = 100
  storage_type           = "gp2"
  db_name                = "mydb"
  engine                 = "mysql"
  engine_version         = "5.7.39"
  instance_class         = "db.t2.micro"
  username               = "admin"
  password               = "admin123"
  parameter_group_name   = "default.mysql5.7"
  publicly_accessible    = false
  db_subnet_group_name   = aws_db_subnet_group.default.name
  vpc_security_group_ids = [aws_security_group.private-sg.id]
  skip_final_snapshot    = true




  provisioner "local-exec" {
    //Commands used when destroying local-exec files then run a terraform apply 
    # when = destroy
    # command = "echo 'Destroy-time provisioner'"

    command = "echo ${aws_db_instance.Database.endpoint} >> db.txt"
  }


}

