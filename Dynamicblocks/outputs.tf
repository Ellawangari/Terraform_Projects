output "devuserarn" {

//Using splat expression 
  value = aws_iam_user.devuser[*].arn

}