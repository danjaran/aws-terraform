variable "aws_region" {
  default = "ap-southeast-1"
}

variable "name_ecr" {
  default = "anjar-ecr-innoscripta"
}

variable "image_tag_mutability" {
  default = "MUTABLE"
}

variable "eks_name" {
  default = "anjar-eks-innoscripta"
}