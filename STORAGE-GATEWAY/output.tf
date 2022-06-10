output "ebs_volume_id" {
   description = "The Elastic Block Storage Volume"
   value = aws_ebs_volume.volume
}

output "gateway_volume_attachment_id" {
   description = "The Storage gateway Volume attachment"
   value = aws_volume_attachment.test
}

output "storage_gateway_cache_id" {
   description = "The Storage gateway cache"    
   value = aws_storagegateway_cache.test
}

output "aws_storagegateway_cached_iscsi_volume_id" {
   description = "The storage gateway chached volume"
   value = aws_storagegateway_cached_iscsi_volume.example
}