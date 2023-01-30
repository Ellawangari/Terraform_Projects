resource "aws_vpc" "registry-vpc" {

 cidr_block           = "192.168.0.0/16"
enable_dns_hostnames = true

}

//Private  subnet
resource "aws_subnet" "private_subnet" {


  vpc_id     = aws_vpc.registry-vpc.id
  cidr_block = "192.168.1.0/24"


  tags = {


    Name = "Private-Subnet"
  }
}