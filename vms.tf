 # Création de deux disques managés
 resource "azurerm_managed_disk" "test" {
   count                = 2
   name                 = "datadisk${var.name}_${count.index}"
   location             = "${var.location}"
   resource_group_name  = "${var.groupe_resource}"
   storage_account_type = "Standard_LRS"
   create_option        = "Empty"
   disk_size_gb         = "20"
 }

# Configuration d'un groupe à haute disponibilité
 resource "azurerm_availability_set" "avset" {
   name                         = "avset${var.name}"
   location                     = "${var.location}"
   resource_group_name          = "${var.groupe_resource}"
   platform_fault_domain_count  = 2
   platform_update_domain_count = 2
   managed                      = true
 }

# Création de deux VM's
 resource "azurerm_virtual_machine" "test" {
   count                 = 2
   name                  = "vm${var.name}_${count.index}"
   location              = "${var.location}"
   availability_set_id   = azurerm_availability_set.avset.id
   resource_group_name   = "${var.groupe_resource}"
   network_interface_ids = [element(azurerm_network_interface.test.*.id, count.index)]
   vm_size               = "Standard_DS1_v2"

# Commenter cette ligne pour retirer la suppression automatique du disque OS lors de la suppression des VMS
   delete_os_disk_on_termination = true

# Commenter cette ligne pour retirer la suppression automatique des datas du disque lors de la suppression des VMS
   delete_data_disks_on_termination = true

   storage_image_reference {
     publisher = "Canonical"
     offer     = "UbuntuServer"
     sku       = "16.04-LTS"
     version   = "latest"
   }

   storage_os_disk {
     name              = "myosdisk${var.name}_${count.index}"
     caching           = "ReadWrite"
     create_option     = "FromImage"
     managed_disk_type = "Standard_LRS"
   }

   os_profile {
     computer_name  = "fabio"
     admin_username = "fabio"
     admin_password = "azerty123!"
   }

   os_profile_linux_config {
     disable_password_authentication = false
   }

   tags = {
     environment = "staging"
   }
 }
