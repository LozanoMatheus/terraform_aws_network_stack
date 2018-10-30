variable "region" {
  
}
module "environment" {
  source = "./environments/aws/training"
  
  region = "${var.region}"
}
