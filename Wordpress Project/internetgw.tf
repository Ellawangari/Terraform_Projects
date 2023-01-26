//public facing internet gateway to allow connectivity from outside

resource "aws_internet_gateway" "public-gw" {

  vpc_id = aws_vpc.wordpress-vpc.id

  tags = {


    Name = "public-facing-gw"
  }

}

