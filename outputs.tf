# Récupération des outputs
 output "resource_group_name" {
   description = "Nom du groupe de ressource"
   value = data.azurerm_resource_group.test.name
 }

 output "public_ip_address" {
   description = "Adresse IP publique"
   value = azurerm_public_ip.test.ip_address
 }

 output "location" {
   description = "Localisation du groupe de ressource"
   value = "${var.location}"
 }

 output "private_ips" {
   description = "Adresses IP privées des VM's"
   value       =  azurerm_network_interface.test.*.private_ip_address           
 }
