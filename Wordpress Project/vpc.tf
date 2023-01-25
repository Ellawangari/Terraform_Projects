resource "aws_vpc" "wordpress-vpc" {


  cidr_block           = "192.168.0.0/16"
  enable_dns_hostnames = true


  tags = {

    Name = "wordpress-vpc"

  }

}


//Public subnet

resource "aws_subnet" "public_subnet" {


  vpc_id                  = aws_vpc.wordpress-vpc.id
  cidr_block              = "192.168.2.0/24"
  map_public_ip_on_launch = true

  tags = {


    Name = "Public-Subnet"
  }
}


//Private subnet

resource "aws_subnet" "private_subnet" {


  vpc_id                  = aws_vpc.wordpress-vpc.id
  cidr_block              = "192.168.3.0/24"
  map_public_ip_on_launch = true

  tags = {


    Name = "Private-Subnet"
  }
}