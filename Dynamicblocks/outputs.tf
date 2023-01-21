output "devuserarn" {

//Using splat expression 
  value = aws_iam_user.devuser[*].arn

}


output "devusernames"{

value = aws_iam_user.devuser[*].name

}

//zipmap function

output "devarn-names"{


  value = zipmap(aws_iam_user.devuser[*].name, aws_iam_user.devuser[*].arn)
}