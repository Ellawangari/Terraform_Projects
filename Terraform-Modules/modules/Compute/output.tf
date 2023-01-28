output "jenkinspublicip"{

  value = aws_instance.jenkinsec2.public_ip

}

output "artifactoryprivateip"{

  value = aws_instance.artifactoryec2.private_ip

}