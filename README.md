# Fabio_Brief12_terraform

Création dans Azure d'un mini cluster load balancé avec 2 VM's

Il est demandé de récupérer les outputs suivants :

- Nom de la région (Location) utilisée
- Nom du groupe de ressources utilisé
- Adresses IP privées des 2 VMs
- Adresse IP publique du load Balancer

Ainsi que d'attacher à chacune de VMs un disque de données avec les cartactéristiques suivantes (size=20 GB, storage account = Standard_LRS) et faire en sorte que les disques OS et Data de chacune des 2 VMs soient supprimés avec les VMs en cas de leur suppression.
