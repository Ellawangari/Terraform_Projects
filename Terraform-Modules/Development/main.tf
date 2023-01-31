
//compute module

# module "Compute" {

#   source         = "../modules/Compute"
#   jenkinsami     = var.jenkinsami
#   artifactoryami = var.artifactoryami
#   key_name       = var.key_name
#   instance-type   = var.instance-type



# }
//Security module
# module "Security" {

#   source = "../modules/Security"




# }
 //VPC module 

 module "VPC" {
 source = "../modules/VPC"




 }

//Using github as our source module

# module "VPC" {   

# source = "https://github.com/Ellawangari/Terraform_Projects.git"

# }



//Using terraform registry verified AWS ec2 instance provisioning module
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 4.0"

  name = "registry-instance"

  ami                    = var.artifactoryami
  instance_type          = var.instance-type
  key_name               = var.key_name
  subnet_id              = module.VPC.private-subnetid

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}


