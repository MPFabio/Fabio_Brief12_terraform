 # Création d'un VNET
 resource "azurerm_virtual_network" "test" {
   name                = "acctvn${var.name}"
   address_space       = ["10.0.0.0/16"]
   location            = "${var.location}"
   resource_group_name = "${var.groupe_resource}"
 }

# Création d'un subnet
 resource "azurerm_subnet" "test" {
   name                 = "acctsub${var.name}"
   resource_group_name  = "${var.groupe_resource}"
   virtual_network_name = azurerm_virtual_network.test.name
   address_prefixes     = ["10.0.2.0/24"]
 }

# Création d'une adresse IP publique
 resource "azurerm_public_ip" "test" {
   name                         = "publicIPForLB${var.name}"
   location                     = "${var.location}"
   resource_group_name          = "${var.groupe_resource}"
   allocation_method            = "Static"
 }

# Création d'une interface réseau
 resource "azurerm_network_interface" "test" {
   count               = 2
   name                = "ni${var.name}_${count.index}"
   location            = "${var.location}"
   resource_group_name = "${var.groupe_resource}"

# Configuration de l'adresse IP
   ip_configuration {
     name                          = "testConfiguration${var.name}"
     subnet_id                     = azurerm_subnet.test.id
     private_ip_address_allocation = "dynamic"
   }
 }
