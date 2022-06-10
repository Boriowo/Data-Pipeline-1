provider "aws" {
  region = var.region
}

resource "aws_ebs_volume" "volume" {
  availability_zone = var.availability_zone
  size              = 40

  tags = {
    Name = var.name
  }
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
  availability_zone = "us-east-1a"

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
  ami           = "ami-0338a84bce7f79aee"
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.foo.id
    device_index         = 0
  }

  credit_specification {
    cpu_credits = "unlimited"
  }
}

#storage gateway
resource "aws_volume_attachment" "test" {
  device_name = var.device_name
  volume_id   = aws_ebs_volume.volume.id
  instance_id = aws_instance.foo.id
}

data "aws_storagegateway_local_disk" "test" {
  disk_node   = aws_volume_attachment.test.device_name
  gateway_arn = aws_storagegateway_gateway.example.arn
}

resource "aws_storagegateway_gateway" "example" {
  gateway_ip_address = "3.226.88.173"
  gateway_name       = var.gateway_name
  gateway_timezone   = var.timezone
  gateway_type       = "FILE_S3"
}

resource "aws_storagegateway_cache" "test" {
  disk_id     = data.aws_storagegateway_local_disk.test.disk_id
  gateway_arn = aws_storagegateway_gateway.example.arn
}

#gateway cache
resource "aws_storagegateway_cache" "example" {
  disk_id     = data.aws_storagegateway_local_disk.test.id
  gateway_arn = aws_storagegateway_gateway.example.arn
}

#cache volume
resource "aws_storagegateway_cached_iscsi_volume" "example" {
  gateway_arn          = aws_storagegateway_cache.example.gateway_arn
  network_interface_id = aws_instance.foo.private_ip
  target_name          = "example"
  volume_size_in_bytes = 53687 # 5 MB
}
