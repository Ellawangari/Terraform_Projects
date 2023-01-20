resource "aws_iam_user" "devuser"{

name = "dev-iamuser.${count.index}"
count = 3 
path = "/system/"

}

