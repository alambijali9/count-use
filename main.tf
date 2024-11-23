#Note-- Either use count or either for-each map concept at one only 


# condition one usecase of count
resource "azurerm_resource_group" "rg" {
  count    = var.rg-create == true ? 1 : 0
  name     = "test"
  location = "westus"
}

# condition one usecase of count
resource "azurerm_resource_group" "name" {
  count    = var.rg-create != true ? 1 : 0
  name     = "test"
  location = "westus"
}

# simple condition

resource "azurerm_resource_group" "name" {
  count    = var.rg-create ? 1 : 0
  name     = "test"
  location = "westus"
}


# without condtion simple count 0/1

resource "azurerm_resource_group" "name" {
  count    = 0 # 0 means no resource create and 1 means resource create
  name     = "test"
  location = "westus"
}

#condition for location pass through variable
resource "azurerm_storage_account" "stg" {
  name                     = "stg1234567"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.location == null ? azurerm_resource_group[0].location : var.location
  access_tier              = "Standard"
  account_replication_type = "LRS"

}
