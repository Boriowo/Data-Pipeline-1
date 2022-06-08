#This is an Elastic Block Storage module to be linked with an EC2 instance
provider "aws" {
    region = var.region
}

resource "aws_ebs_volume" "volume" {
  availability_zone = var.availability_zone
  size              = 40

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_ebs_snapshot" "snapshot" {
  volume_id = aws_ebs_volume.volume.id

  tags = {
    Name = "HelloWorld_snap"
  }
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = var.device_name
  volume_id   = aws_ebs_volume.volume.id
  instance_id = aws_instance.foo.id
}

#Create a VPC and subnet to house the instance
resource "aws_vpc" "my_vpc" {
  cidr_block = var.cidr1 

  tags = {
    Name = "tf-example"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.cidr2 
  availability_zone = var.availability_zone

  tags = {
    Name = "tf-example"
  }
}

resource "aws_network_interface" "foo" {
  subnet_id   = aws_subnet.my_subnet.id
  private_ips = var.private_ip 

  tags = {
    Name = "primary_network_interface"
  }
}

resource "aws_instance" "foo" {
  ami           = var.ami 
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.foo.id
    device_index         = 0
  }

  credit_specification {
    cpu_credits = "unlimited"
  }
}
