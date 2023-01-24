resource "aws_security_group" "allowhttp" {
  name        = "dynamic-sg"
  description = "ingress rules"

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
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

  }

}