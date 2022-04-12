resource "aws_instance" "production" {
  ami           		= "ami-055d15d9cfddf7bd3" #Ubuntu Server 20.04 LTS (HVM), SSD Volume Type
  instance_type 		= "t2.medium"
  subnet_id			= "subnet-05d700aa409c8f93c" #Subnet Private on VPC Private Production
  associate_public_ip_address	= "false"
  vpc_security_group_ids	= ["sg-059e3812baef6f3d8","sg-0ce83b1a4bfa8361b"] #Attach SecgroupID AllowSSH & Default
  monitoring			= "true"
  key_name			= "vm-production-test"

  root_block_device {
    delete_on_termination 	= "true"
    volume_size			= "100"
  }

  tags = {
    Name 	= "vm-production"
    Env  	= "production"
    CreateBy	= "terraform"
  }
}
