variable "prefix" {
  description = "The prefix which should be used for all resources in this example"
  default = "WebServerWithTF"
}

variable "resource_group_name" {
  description = "Name of the resource group."
  default = "Azuredevops"
}

variable "location" {
  description = "The Azure Region in which all resources in this example should be created."
  default = "East US"
}

variable "vm_count" {
  description = "Number of Virtualmachines."
  default = "3"
}

variable "image_id" {
  description = "Name of packer image."
  default = "/subscriptions/7c7d6a08-6630-41e6-9087-a19703fef514/resourceGroups/Azuredevops/providers/Microsoft.Compute/images/UbuntuPackerImage"
}

variable "username" {
  description = "VMs username."
  default = "amro"
}

variable "password" {
  description = "VMs password."
  default = "WQEDWQc#@!0"
}