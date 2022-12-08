resource "aws_instance" "kubernetes" {

  count = 3 #1 master 2 slave

  ami               = var.aws_ami
  instance_type     = var.instance_type
  # source_dest_check = false
  key_name          = var.key_ssh
  subnet_id         = var.subnet_id
  security_groups   = var.security_group_ids
  user_data     = var.user_data
  tags = {
    Name = var.name_ec2_kubernetes
  }
  root_block_device {
#    delete_on_termination = true
#    encrypted             = false
#    iops                  = 100
    volume_size           = 10
#    volume_type           = "gp2"
  }
}

resource "aws_instance" "middleware" {

  count = 1

  ami               = var.aws_ami
  instance_type     = var.instance_type
  # source_dest_check = false
  key_name          = var.key_ssh
  subnet_id         = var.subnet_id
  security_groups   = var.security_group_ids
  user_data     = var.user_data
  tags = {
    Name = var.name_ec2_middlewares
  }
  root_block_device {
#    delete_on_termination = true
#    encrypted             = false
#    iops                  = 100
    volume_size           = 10
#    volume_type           = "gp2"
  }
}


resource "aws_instance" "engine_services" {

  count = 3

  ami               = var.aws_ami
  instance_type     = var.instance_type
  # source_dest_check = false
  key_name          = var.key_ssh
  subnet_id         = var.subnet_id
  security_groups   = var.security_group_ids
  user_data     = var.user_data
  tags = {
    Name = var.name_ec2_engine
  }
  root_block_device {
#    delete_on_termination = true
#    encrypted             = false
#    iops                  = 100
    volume_size           = 10
#    volume_type           = "gp2"
  }
}