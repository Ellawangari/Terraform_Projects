resource "aws_instance" "Wordpress-server" {
  //creating the instance
  depends_on            = [aws_internet_gateway.public-gw]
  instance_type         = var.instance-type
  ami                   = var.ami
  key_name              = "terraform-prac"
  subnet_id             = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.public-sg.id]

  tags = {

    Name = "Wordpress-server"


  }

  //user script to be executed on the server

  user_data = <<EOF
     #! /bin/bash
     sudo yum install httpd php php-mysql -y -q
     sudo cd  /var/www/html
     echo "Welcome" > index.html
     sudo tar -xzf wordpress-5.1.1.tar.gz
     sudo cp -r wordpress/* /var/www/html/
     sudo rm -rf wordpress
     sudo rm -rf  wordpress-5.1.1.tar.gz
     sudo chmod -R 755 wp-content
     sudo chwon -R apache:apache wp-content
     sudo wget https://s3.amazonaws.com/bucketforwordpresslab-donotdelete/htaccess.txt
     sudo mv htaccess.txt .htaccess
     sudo systemctl start httpd
     sudo systemctl enable httpd
  EOF




  //Provisioner

  provisioner "local-exec" {




    command = "echo ${aws_instance.Wordpress-server.public_ip} >> public_ip.txt"



  }


}