variable "prefix" {
  description = "The prefix which should be used for all resources in this example"
  default = "TestServerWithTF"
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
  default = ""
}

variable "username" {
  description = "VMs username."
}

variable "password" {
  description = "VMs password."
}