provider "aws" {
  region = "us-west-2"
}

module "Athena" {
    source = "./ATHENA"
    region =  "us-west-2"
    bucket =  "our-bucket"
    name   =  "database_name"
}

module "Dynamo" {
    source = "./DYNAMO"
    region =  "us-west-2"
    tb-name =  "my-table"
}

module "Ebs" {
    source = "./EBS"
    region =  "us-westt-2"
    availability_zone =  "us-west-2a"
    ami   =  "ami-005e54dee72cc1d00"
    device_name= "/dev/sdh"
    private_ip = ["172.16.10.100"]
    cidr1 = "172.16.0.0/16"
    cidr2 = "172.16.10.0/24"
}

module "Efs" {
    source = "./EFS"
    region =  "us-west-2"
    token =  "my-product"
}

# module "Storage_gateway" {
#    source = "./STORAGE-GATEWAY"
#    region =  "us-east-2"
#    availability_zone =  "us-east-2a"
#    name   =  "Testing"
#    device_name= "/dev/xvdb"
#    amis =   "ami-005e54dee72cc1d00"
#    ip = "172.16.4.203"
#    gateway_name = "example"
#    timezone = "GMT"
#    private_ip = ["172.16.10.100"]
#    cidr1 = "172.16.0.0/16"
#    cidr2 = "172.16.10.0/24"
#}

