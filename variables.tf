variable "snowflake_username" {
  type        = string
  description = "Snowflake username."
}

variable "role_name" {
  type        = string
  description = "The role_name to grant the user."
  default     = "ACCOUNTADMIN"
}

variable "snowflake_connection_url" {
  type        = string
  description = "Snowflake connection URL."
}

variable "vault_db_path" {
  type        = string
  description = "Vault database secret engine mount path."
}

variable "allowed_roles" {
  type        = list(string)
  description = "List of allowed roles for snowflake database connection."
  default     = ["demo"]
}

variable "default_ttl" {
  type        = number
  description = "Default TTL in seconds for snowflake demo role."
  default     = 300
}

variable "max_ttl" {
  type        = number
  description = "Max TTL in seconds for snowflake demo role."
  default     = 3600
}