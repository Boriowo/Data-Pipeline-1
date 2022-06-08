output "ebs_volume_id" {
   description = "The Elastic Block Storage Volume"
   value = aws_ebs_volume.volume
}

output "ebs_snapshot_id" {
   description = "The Elastic Block Storage Snapshot"
   value       = aws_ebs_snapshot.snapshot
}

output "volume_attach_id" {
   description = "The Elastic Block Storage Volume Attachment"
   value       = aws_volume_attachment.ebs_att
}

output "ebs_instance_id" {
   description = "The Instance Created in the Elastic Block Storage"
   value       = aws_instance.foo
}
