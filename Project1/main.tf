
resource "aws_instance" "test_server" {

  ami           = "ami-0a6b2839d44d781b2"
  instance_type = "t2.micro"

  tags = {
    Name = "terraformpractice"
  }
}

