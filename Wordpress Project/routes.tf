//route table for the internet gw

resource "aws_default_route_table" "gw-route" {

  default_route_table_id = aws_vpc.wordpress-vpc.default_route_table_id

  route {

    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.public-gw.id

  }

  tags = {



    Name = "default-routetable"
  }


}


//Associate public subnet with the route table

resource "aws_route_table_association" "associate_subnet" {


  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_default_route_table.gw-route.id
}