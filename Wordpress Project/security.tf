//Security grup for public subnet
resource "aws_security_group" "public-sg" {
  name        = "wordpress-sg"
  description = "allow ssh and http"
  vpc_id      = aws_vpc.wordpress-vpc.id


  dynamic "ingress" {

    for_each = var.sg_ports
    content {

      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

  }
  //egress

  dynamic "egress" {

    for_each = var.egress_ports
    content {

      from_port   = 0
      to_port     = egress.value
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }

  }

}

//security group for private subnet
resource "aws_security_group" "private-sg" {
  name        = "db-sg"
  description = "allow port 3306"
  vpc_id      = aws_vpc.wordpress-vpc.id


  dynamic "ingress" {

    for_each = var.privatesg_ports
    content {

      description = "MYSQL port"
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

  }
  //egress

  dynamic "egress" {

    for_each = var.egress_ports
    content {

      from_port   = 0
      to_port     = egress.value
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }

  }

}