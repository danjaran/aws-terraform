provider "aws" {
  region  = var.aws_region
  profile = "default"
}

terraform {
  backend "s3" {
    bucket      = "anjar-s3-terraform"
    region      = "ap-southeast-1"
    key         = "anjar-owner-ec2-redis.tfstate" #change servicename, ex : ula-dev-catalog-management.tfstate
    profile     = "default"
  }
}

module "redis_ec2" {
    source = "../../modules/EC2/"

    count = 1
  
    instance_type       = var.instance_type
    aws_ami             = var.aws_ami
    key_ssh             = var.key_ssh
    subnet_id           = var.subnet_id
    name_ec2            = "${var.name_ec2}-${count.index}"
    user_data           = "${file("install-redis.sh")}"

}