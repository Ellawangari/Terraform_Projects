//Output the eip public address on the terminal

output "eip" {

  value = aws_eip.testserverip.public_ip

}