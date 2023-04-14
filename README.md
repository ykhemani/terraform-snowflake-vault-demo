# terraform-snowflake-vault-demo

## Under Development

This repo does the following:
* creates a Snowflake user for Vault to use for creating dynamic secrets for the Snowflake database
* enables a Vault database secrets engine
* configures a connection in Vault to the Snowflake database
* creates a role in Vault for providing dynamic, just-in-time credentials for the Snowflake database

## Use

### Running Terraform

Set the following Terraform variables to run this Terraform configuration:

| Variable | Value | Type |
|----------|-------|------|
| `SNOWFLAKE_ACCOUNT` | Snowflake account. For example: `abcdefg-abc12345` | env |
| `SNOWFLAKE_USER` | A snowflake account with `ACCOUNTADMIN` permissions, to enable us to create a Snowflake user for use by Vault. | env |
| `SNOWFLAKE_PASSWORD` | The password for `SNOWFLAKE_USER`, mark as sensitive in TFC. | env |
| `VAULT_ADDR` | The address for Terraform to use to connect to your Vault cluster | env |
| `VAULT_NAMESPACE` | Your Vault namespace, if applicable | env |
| `VAULT_TOKEN` | Vault token for authenticating with Vault, mark as sensitive in TFC. | env |
| `snowflake_connection_url` | Snowflake connection URL for the Vault database configuration. For example: `{{username}}:{{password}}@abcdefg-abc12345.snowflakecomputing.com` | terraform |
| `snowflake_username` | The Snowflake user to create for use by Vault, in all caps. For example: `VAULT` | terraform |
| `vault_db_path` | Vault database secret engine mount path | terraform |
| `vault_db_role` | Vault database role for this demo | terraform |

The Terraform run must be able to connect to your Snowflake warehouse, as well as your Vault cluster. If using Terraform Cloud, configure your workspace to use an agent-based run and specify an agent pool with agents that are able to connect to your Vault cluster.

### Using the role.

Once the Vault dynamic secret role is setup, you may authenticate with Vault using an identity that has a policy attached that enables use of this role. You may then use the role to request dynamic credentials.

```
vault read `vault_db_path`/creds/`vault_db_role`
```

For example:

```
$ vault read sfdb-demo/creds/demo
Key                Value
---                -----
lease_id           sfdb-demo/creds/demo/2R6ksFq44gsnsuDimx5K7jkv
lease_duration     5m
lease_renewable    true
password           4BG8K-b-mgXvW5in0F8T
username           v_root_demo_mPG3zDMnv1Po402G0vrC_1681475459
```

You may then use that user to connect to Snowflake.

```
/Applications/SnowSQL.app/Contents/MacOS/snowsql -a `SNOWFLAKE_ACCOUNT` -u `username`
```

For example:

```
$ /Applications/SnowSQL.app/Contents/MacOS/snowsql -a abcdefg-abc12345 -u v_root_demo_mPG3zDMnv1Po402G0vrC_1681475459
```

When you finish testing, you may revoke the lease as follows:

```
vault lease revoke `lease_id`
```

For example:

```
$ vault lease revoke sfdb-demo/creds/demo/2R6ksFq44gsnsuDimx5K7jkv
All revocation operations queued successfully!
```

---
