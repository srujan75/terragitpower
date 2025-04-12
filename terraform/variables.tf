## 
# Variables
##

variable "location" {
    type = string
    default = "eastus"
}

variable "naming_prefix" {
  type    = string
  default = "srujanter2"
}

variable "tag_environment" {
  type    = string
  default = "srujantest"
}

variable "tag_owner" {
  type    = string
  default = "srujanreddy"
}