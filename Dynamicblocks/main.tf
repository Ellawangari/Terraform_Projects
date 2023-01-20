# resource "aws_security_group" "dynamicsg"{

# name = "dynamic-sg"
# description = "ingress rules"

# dynamic "ingress" {

# for_each = var.sg_ports
# content {

#     from_port = port.value
#     to_port = port.value
#     protocol = "tcp"
#     cidr_blocks =["0.0.0.0/0"]
# }

# }

# }