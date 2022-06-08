#Calling all variables from the main.tf

#Variable for the region
variable "region" {
    type = string
    description = "Enter your perferred region"
}

#variable for the amazon s3 bucket
variable "bucket" {
    type = string
    description = "Enter your bucket name"
}

#variable for the athena database
variable "name" {
    type = string
    description = "Enter your Athena Database name"
}