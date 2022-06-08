variable "region" {
    type = string
    description = "Enter the region"
}

variable "availability_zone" {
    type = string
    description = "Enter your preferred availability zone"
}

variable "ami" {
    type = string
    description = "Enter your AMI"
}

variable "device_name" {
    type = string
    description = "Enter the Device Name"
}

variable "private_ip" {
    type = list(string)
    description = "Enter your private IP"
}

variable "cidr1" {
    type = string
    description = "Enter the cidr block for your vpc"
}

variable "cidr2" {
    type = string
    description = "Enetr your subnet cidr block"
}