terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.61.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "3.14.0"
    }
  }
}