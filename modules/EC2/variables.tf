variable "aws_region" {
  default = "ap-southeast-1"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "aws_ami" {
  default = "amazonanjar"
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

variable "name_ec2" {
}