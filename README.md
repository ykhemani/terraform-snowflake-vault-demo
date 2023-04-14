# terraform-snowflake-vault-demo

## Under Development

This repo does the following:
* creates a Snowflake user for Vault to use for creating dynamic secrets for the Snowflake database
* enables a Vault database secrets engine
* configures a connection in Vault to the Snowflake database
* creates a role in Vault for providing dynamic, just-in-time credentials for the Snowflake database

## Use

Set environment variables as required by the Snowflake Terraform provider. For example:
* `SNOWFLAKE_ACCOUNT`
* `SNOWFLAKE_USER`
* `SNOWFLAKE_PASSWORD`

Set environment variables as required by your Vault cluster. For example:
* `VAULT_ADDR`
* `VAULT_TOKEN`
* `VAULT_NAMESPACE`

Set the following Terraform variables:

* `snowflake_connection_url`
* `snowflake_username`
* `vault_db_path`

