output "bucket_id" {
   description = "The bucket for storing all the queries on SQL"
   value = aws_s3_bucket.example
}
output "athena_id" {
   description = "The Name of the Athena database"
   value       = aws_athena_database.example
}
