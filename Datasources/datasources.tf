data "aws_ami" "app-ami" {

most_recent = true
owners =["amazon"]
filter {

  name = "name"
  values = ["amzn2-ami-hvm*"]

}

}