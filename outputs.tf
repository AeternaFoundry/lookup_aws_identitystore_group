output "identitystore_group_lookup_id" {
  description = "Map of id values across all identitystore_group_lookup, keyed the same as var.identitystore_group_lookup"
  value       = { for k, v in data.aws_identitystore_group.identitystore_group_lookup : k => v.id if v.id != null && length(v.id) > 0 }
}
output "identitystore_group_lookup_alternate_identifier" {
  description = "Map of alternate_identifier values across all identitystore_group_lookup, keyed the same as var.identitystore_group_lookup"
  value       = { for k, v in data.aws_identitystore_group.identitystore_group_lookup : k => one(v.alternate_identifier) if v.alternate_identifier != null && length(v.alternate_identifier) > 0 }
}
output "identitystore_group_lookup_description" {
  description = "Map of description values across all identitystore_group_lookup, keyed the same as var.identitystore_group_lookup"
  value       = { for k, v in data.aws_identitystore_group.identitystore_group_lookup : k => v.description if v.description != null && length(v.description) > 0 }
}
output "identitystore_group_lookup_display_name" {
  description = "Map of display_name values across all identitystore_group_lookup, keyed the same as var.identitystore_group_lookup"
  value       = { for k, v in data.aws_identitystore_group.identitystore_group_lookup : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "identitystore_group_lookup_external_ids" {
  description = "Map of external_ids values across all identitystore_group_lookup, keyed the same as var.identitystore_group_lookup"
  value       = { for k, v in data.aws_identitystore_group.identitystore_group_lookup : k => v.external_ids if v.external_ids != null && length(v.external_ids) > 0 }
}
output "identitystore_group_lookup_group_id" {
  description = "Map of group_id values across all identitystore_group_lookup, keyed the same as var.identitystore_group_lookup"
  value       = { for k, v in data.aws_identitystore_group.identitystore_group_lookup : k => v.group_id if v.group_id != null && length(v.group_id) > 0 }
}
output "identitystore_group_lookup_identity_store_id" {
  description = "Map of identity_store_id values across all identitystore_group_lookup, keyed the same as var.identitystore_group_lookup"
  value       = { for k, v in data.aws_identitystore_group.identitystore_group_lookup : k => v.identity_store_id if v.identity_store_id != null && length(v.identity_store_id) > 0 }
}
output "identitystore_group_lookup_region" {
  description = "Map of region values across all identitystore_group_lookup, keyed the same as var.identitystore_group_lookup"
  value       = { for k, v in data.aws_identitystore_group.identitystore_group_lookup : k => v.region if v.region != null && length(v.region) > 0 }
}

