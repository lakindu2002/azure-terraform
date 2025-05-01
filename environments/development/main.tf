resource "azurerm_resource_group" "azure_samples" {
  name     = "azure-samples"
  location = "East US"
}

resource "azurerm_cosmosdb_account" "sample-cosmos-db" {
  name                = "lakindu-sample-cosmos-db"
  resource_group_name = azurerm_resource_group.azure_samples.name
  geo_location {
    failover_priority = 0
    location          = "East US"
    zone_redundant    = true
  }
  consistency_policy {
    consistency_level = "Session"
  }
  offer_type                    = "Standard"
  location                      = "East US"
  enable_free_tier              = true
  public_network_access_enabled = true
}

resource "azurerm_storage_account" "media" {
  name                     = "lakindu-media"
  resource_group_name      = azurerm_resource_group.azure_samples.name
  account_tier             = "Cool"
  account_replication_type = "LRS"
  location                 = "East US"
}

resource "azurerm_storage_container" "static" {
  name                  = "static"
  storage_account_name  = azurerm_cosmosdb_account.sample-cosmos-db.name
  container_access_type = "private"
}
