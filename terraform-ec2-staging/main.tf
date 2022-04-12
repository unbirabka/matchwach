resource "aws_instance" "staging" {
  ami           		= "ami-055d15d9cfddf7bd3" #Ubuntu Server 20.04 LTS (HVM), SSD Volume Type
  instance_type 		= "t2.small"
  subnet_id			= "subnet-06e93210c21f70912" #Subnet Private on VPC Private Staging
  associate_public_ip_address	= "false"
  vpc_security_group_ids	= ["sg-0dee336a75c24f854","sg-0f78e3b9c405cd16a"] #Attach SecgroupID AllowSSH & Default
  monitoring			= "true"
  key_name                      = "vm-staging-test"

  root_block_device {
    delete_on_termination 	= "true"
    volume_size			= "100"
  }

  tags = {
    Name 	= "vm-staging"
    Env  	= "staging"
    CreateBy	= "terraform"
  }
}
