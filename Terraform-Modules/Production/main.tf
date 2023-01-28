//compute module

module "Compute" {

source = "../../modules/Compute"
jenkinsami  = var.jenkinsami
artifactoryami = var.artifactoryami
key_name = var.key_name  
instance-type   = var.instancetype


}