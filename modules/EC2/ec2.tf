resource "aws_instance" "public" {
  ami               = var.aws_ami
  instance_type     = var.instance_type
  # source_dest_check = false
  key_name          = var.key_ssh
  subnet_id         = var.subnet_id
  security_groups   = var.security_group_ids
  user_data     = var.user_data
  tags = {
    Name = var.name_ec2
  }
  root_block_device {
#    delete_on_termination = true
#    encrypted             = false
#    iops                  = 100
    volume_size           = 8
#    volume_type           = "gp2"
  }
}