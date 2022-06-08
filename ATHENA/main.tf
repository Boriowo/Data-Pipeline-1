#This module helps in creating an interactive query service 
#that makes it easy to analyze data in Amazon S3 using standard SQL.


#Create a provider 
provider "aws" {
  region = var.region
}

#Create a bucket for your athena database 
resource "aws_s3_bucket" "example" {
  bucket = var.bucket
  force_destroy = true
}

#Create an athena database resource
resource "aws_athena_database" "example" {
  name   = var.name
  bucket = aws_s3_bucket.example.bucket
}

