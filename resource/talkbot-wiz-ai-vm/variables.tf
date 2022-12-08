variable "aws_region" {
  default = "ap-southeast-1"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "aws_ami" {
  default = "ami-0fef8c1409596e79f" #centos 7 in ap-southest-1
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

variable "user_data" {
  default = ""
}

variable "name_ec2_engine" {
  default = "wiz-engine"
}

variable "name_ec2_kubernetes" {
  default = "wiz-kubernetes"
}

variable "name_ec2_middlewares" {
  default = "wiz-middleware"
}