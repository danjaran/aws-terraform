provider "aws" {
  region  = var.aws_region
  profile = "default"
}

terraform {
  backend "s3" {
    bucket      = "anjar-s3-terraform"
    region      = "ap-southeast-1"
    key         = "anjar-owner-ec2-kubernetes.tfstate" #change servicename, ex : ula-dev-catalog-management.tfstate
    profile     = "default"
  }
}

module "kubernetes_master_ec2" {
    source = "../../modules/EC2/"

    count = 1
  
    instance_type       = var.instance_type
    aws_ami             = var.aws_ami
    key_ssh             = var.key_ssh
    subnet_id           = var.subnet_id
    name_ec2            = "${var.name_ec2}-master-${count.index}"
    user_data           = "${file("install-kubernetes-master.sh")}"

}

module "kubernetes_slave_ec2" {
    source = "../../modules/EC2/"

    count = 0
  
    instance_type       = var.instance_type
    aws_ami             = var.aws_ami
    key_ssh             = var.key_ssh
    subnet_id           = var.subnet_id_slave
    name_ec2            = "${var.name_ec2}-slave-${count.index}"
    user_data           = "${file("install-kubernetes-slave.sh")}"

}