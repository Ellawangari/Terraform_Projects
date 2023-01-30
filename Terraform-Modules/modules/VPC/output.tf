output "private-subnetid"{

  value = aws_subnet.private_subnet.id

}
output "vpccidrblock"{

  value = aws_vpc.registry-vpc.cidr_block  

}