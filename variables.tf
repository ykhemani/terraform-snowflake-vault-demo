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

variable "vault_db_role" {
  type        = string
  description = "Vault database role for this demo."
  default     = "demo"
}

variable "vault_db_role_creation_statements" {
  type        = list(string)
  description = "Snowflake SQL statement to create dynamic user."
  default     = ["CREATE USER {{name}} PASSWORD = '{{password}}' DAYS_TO_EXPIRY = {{expiration}};"]
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