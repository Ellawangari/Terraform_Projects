##### Terraform Project 1

- This project allowed me to  relearning the basics of terraform infrastructure provisioning on AWS by creating a simple EC2 instance of Ubuntu AMI and t2.micro type
- Ensured AWS CLI was installed and configured my Access key.
- Played aound with the most commonly used terraform commands which were:
```
terraform init- initializes terraform
terraform fmt- formats the terraform files for easier readerability
terraform validate - validates the configuration
terraform plan
terraform apply/ terraform apply --auto-approve
terraform show - allows one to view the resources as per the terraform.tfstate file configuration
terraform state list - list of the resources in your project's state
terraform destroy/ terraform destroy --auto-approve

```


- The differeence btwn variable.tf and terraform.tfvars file is that for variable files it declares variables which might have a default value or not while for terraform.tfvars are where all variables are assigned values.
- Also for the terraform.tfvars file You can't define new variables here, and can only set the values of existing ones defined in variables.tf.

