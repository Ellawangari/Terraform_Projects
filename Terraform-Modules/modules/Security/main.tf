module "VPC" {

  source         = "../VPC"


 

}


resource "aws_security_group" "allowhttp"{
  name = "dynamic-sg"
  description = "ingress rules"

  dynamic "ingress" {

   for_each = local.sg_ports
    content {

    from_port = ingress.value
    to_port = ingress.value
    protocol = "tcp"
    cidr_blocks = [module.VPC.vpccidrblock]
            }

}
}


// locals help prevent values from being overridden in other files
locals  {

sg_ports =[22]

}