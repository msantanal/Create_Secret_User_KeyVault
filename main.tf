data "azurerm_resource_group" "RG" {
  name = var.resource_group_name
}

data "azurerm_key_vault" "keyvault" {
  name = var.name_keyvault
}

# Generate Ramdon String
resource "random_string" "random_user" {
  length                       = "14"
  special                      = "true"
}
# Create the secret for user
resource "azurerm_key_vault_secret" "user_secret" {
  name                         = var.usersecret_name
  value                        = random_string.random_user.result
  key_vault_id                 = data.azurerm_key_vault.keyvault.id
}
