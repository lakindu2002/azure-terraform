resource "azurerm_resource_group" "azure_samples" {
  name     = "azure-samples"
  location = "East US"
}

module "storage_account" {
  source                   = "../../modules/storage_account"
  storage_account_name     = "lakindusstoragemodule"
  resource_group_name      = azurerm_resource_group.azure_samples.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
  location                 = azurerm_resource_group.azure_samples.location
  containers = [
    {
      name        = "container1"
      access_type = "private"
    },
    {
      name        = "container2"
      access_type = "blob"
    }
  ]
}
