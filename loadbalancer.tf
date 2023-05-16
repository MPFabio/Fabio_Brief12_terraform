# Création d'un loadBalancer
 resource "azurerm_lb" "test" {
   name                = "loadBalancer${var.name}"
   location            = "${var.location}"
   resource_group_name = "${var.groupe_resource}"

# Création d'un frontend IP
   frontend_ip_configuration {
     name                 = "publicIPAddress${var.name}"
     public_ip_address_id = azurerm_public_ip.test.id
   }
 }

# Création d'un backend pool
 resource "azurerm_lb_backend_address_pool" "test" {
   loadbalancer_id     = azurerm_lb.test.id
   name                = "BackEndAddressPool${var.name}"
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
