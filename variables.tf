# Définition des variables
variable "location" {
  type        = string
  default     = "francecentral"
  description = "Location of the resource group."
}

variable "name"  {
  type        = string
  default     = "_de_fabio"
  description = "suffixe de nommage"
}

variable "groupe_resource" {
    type      = string
    default   = "FabioGrpRsrc"
}
