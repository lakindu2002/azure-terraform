resource "azurerm_storage_account" "this" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  location                 = var.location
}

resource "azurerm_storage_container" "this" {
  for_each               = { for container in var.containers : container.name => container }
  name                  = each.value.name
  storage_account_name  = azurerm_storage_account.this.name
  container_access_type = each.value.access_type
}
