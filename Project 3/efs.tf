//Creates a  Elastic file system on aws
resource "aws_efs_file_system" "web-efs" {
  creation_token = "my-efs"

  tags = {
    Name = "Web-efs"
  }
}

//mounting the efs to the instance

resource "aws_efs_mount_target" "mount" {
  file_system_id = aws_efs_file_system.web-efs.id
  subnet_id      = aws_instance.web-ec2.subnet_id
  security_groups =  [aws_security_group.allowhttp.id]
}
