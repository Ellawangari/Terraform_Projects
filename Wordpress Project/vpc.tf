resource "aws_vpc" "wordpress-vpc" {

 
 cidr_block = "192.168.0.0/16"
 enable_dns_hostnames = true


 tags = {

Name = "wordpress-vpc"

 }

}