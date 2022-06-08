output "efs_id" {
   description = "The Elastic File storage"
   value = aws_efs_file_system.fs
}
output "efs_policy_id" {
   description = "The Elastic File storage Policy"
   value       = aws_efs_file_system_policy.policy
}

output "efs_backup_policy_id" {
   description = "The Elastic File storage Backup Policy"
   value       = aws_efs_backup_policy.policy
}

