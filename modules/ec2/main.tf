resource "aws_instance" "this" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name = var.name
  }

  key_name = var.key_name

  vpc_security_group_ids      = var.vpc_security_group_ids
  subnet_id                   = var.subnet_id
  private_ip                  = var.private_ip
  availability_zone           = var.availability_zone
  associate_public_ip_address = var.associate_public_ip_address

  root_block_device {
    volume_size           = var.root_block_device_size
    volume_type           = var.root_block_device_type
    encrypted             = var.root_block_device_encrypted
    delete_on_termination = var.root_block_device_delete_on_termination
    iops                  = var.root_block_device_iops
  }
}

#resource "aws_eip" "this" {
#  depends_on = [aws_instance.this]
#}
#
#resource "aws_eip_association" "this" {
#  instance_id   = aws_instance.this.id
#  allocation_id = aws_eip.this.id
#}
