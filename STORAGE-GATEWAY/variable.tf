variable "region" {
    type = string
    description = "Enter your preferred region"
}

variable "availability_zone" {
    type = string
    description= "Enter your preferred availability zone"
}

variable "name" {
    type = string
    description = "Enter your preferred name"
}

variable "device_name" {
    type = string
    description = "Enter your preferred device name"
}

#variable "amis" {
 #   type = string
 #   description = "Enter the ami"   
#}

#variable "ip" {
 #   type = string
 #   description = "Enter your gateway ip address"
#}

variable "gateway_name" {
    type = string
    description = "Enter your gateway name"
}

variable "timezone" {
    type = string
    description = "Enter your preferred time zone"
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