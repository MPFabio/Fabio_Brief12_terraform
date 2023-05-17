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
