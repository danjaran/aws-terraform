provider "aws" {
  region  = var.aws_region
  profile = "default"
}

terraform {
  backend "s3" {
    bucket      = "anjar-s3-terraform"
    region      = "ap-southeast-1"
    key         = "anjar-owner-innoscripta.tfstate" 
    profile     = "default"
  }
}

module "innoscripta_ecr" {
    source = "../../modules/ECR/"
  
    name_ecr              = var.name_ecr
    image_tag_mutability  = var.image_tag_mutability
}

module "innoscripta_eks" {
    source = "../../modules/EKS/"
  
    eks_name       = var.eks_name
}

