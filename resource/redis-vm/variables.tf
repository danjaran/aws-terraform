variable "aws_region" {
  default = "ap-southeast-1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "aws_ami" {
  default = "ami-0c777ba9e7c011e04" #ubuntu 18.04 in ap-southest-1
}

variable "key_ssh" {
  default = "amazonanjar"
}

variable "subnet_id" {
  default = "subnet-7ceb3034"
}

variable "security_group_ids" {
  default = ["sg-20027b6a"]
}

variable "name_ec2" {
  default = "anjar-prd-redis"
}