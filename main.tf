data "aws_identitystore_group" "identitystore_group_lookup" {
  for_each = var.identitystore_group_lookup

  identity_store_id = each.value.identity_store_id
  group_id          = each.value.group_id
  region            = each.value.region

  dynamic "alternate_identifier" {
    for_each = each.value.alternate_identifier != null ? [each.value.alternate_identifier] : []
    content {
      dynamic "external_id" {
        for_each = alternate_identifier.value.external_id != null ? [alternate_identifier.value.external_id] : []
        content {
          id     = external_id.value.id
          issuer = external_id.value.issuer
        }
      }
      dynamic "unique_attribute" {
        for_each = alternate_identifier.value.unique_attribute != null ? [alternate_identifier.value.unique_attribute] : []
        content {
          attribute_path  = unique_attribute.value.attribute_path
          attribute_value = unique_attribute.value.attribute_value
        }
      }
    }
  }
}

