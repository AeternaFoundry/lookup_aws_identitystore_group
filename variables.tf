variable "identitystore_group_lookup" {
  description = <<EOT
Map of identitystore_group_lookup, attributes below
Required:
    - identity_store_id
Optional:
    - group_id
    - region
    - alternate_identifier (block):
        - external_id (optional, block):
            - id (required)
            - issuer (required)
        - unique_attribute (optional, block):
            - attribute_path (required)
            - attribute_value (required)
EOT

  type = map(object({
    identity_store_id = string
    group_id          = optional(string)
    region            = optional(string)
    alternate_identifier = optional(object({
      external_id = optional(object({
        id     = string
        issuer = string
      }))
      unique_attribute = optional(object({
        attribute_path  = string
        attribute_value = string
      }))
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.identitystore_group_lookup : (
        v.group_id == null || ((length(v.group_id) >= 1 && length(v.group_id) <= 47) && (can(regex("^([0-9a-f]{10}-|)[0-9A-Fa-f]{8}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{12}$", v.group_id))))
      )
    ])
    error_message = "all of: must be between 1 and 47 characters; must match ([0-9a-f]{10}-|)[0-9A-Fa-f]{8}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{12}"
  }
  validation {
    condition = alltrue([
      for k, v in var.identitystore_group_lookup : (
        (length(v.identity_store_id) >= 1 && length(v.identity_store_id) <= 64) && (can(regex("^[0-9A-Za-z-]*$", v.identity_store_id)))
      )
    ])
    error_message = "all of: must be between 1 and 64 characters; must match [0-9A-Za-z-]"
  }
}

