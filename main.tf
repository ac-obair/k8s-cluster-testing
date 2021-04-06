// terraform {
//   backend "azurerm" {
//     storage_account_name = "actfstate"
//     container_name       = "ac-iac-platform"
//     key                  = "dev/aks-cluster-1-config"
//   }
// }

provider "kubernetes" {
  version        = "=1.11.3"
  config_context = "docker-desktop"
}

provider "helm" {
  version = "=1.2.3"
  kubernetes {
    config_context = "docker-desktop"
  }
}

// provider "azurerm" {
//   version         = "=2.16.0"
//   subscription_id = "c6d6b051-f122-44dc-ba45-6b2331c1e8ee"
//   features {}
// }

// data "azurerm_key_vault" "platform-1" {
//   name                = "platform-1"
//   resource_group_name = "ac-iac-platform"
// }

// data "azurerm_key_vault_secret" "newrelic-licence" {
//   name         = "new-relic-pro"
//   key_vault_id = data.azurerm_key_vault.platform-1.id
// }

// data azurerm_key_vault_secret "int-ca-cert" {
//   name         = "azure-intermediate-cert"
//   key_vault_id = data.azurerm_key_vault.platform-1.id
// }

// data azurerm_key_vault_secret "int-ca-key" {
//   name         = "azure-intermediate-key"
//   key_vault_id = data.azurerm_key_vault.platform-1.id
// }
