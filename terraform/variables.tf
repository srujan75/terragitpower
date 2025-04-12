## 
# Variables
##

variable "location" {
    type = string
    default = "us east"
}

variable "naming_prefix" {
  type    = string
  default = "srujanterra"
}

variable "tag_environment" {
  type    = string
  default = "srujantest"
}

variable "tag_owner" {
  type    = string
  default = "srujanreddy"
}