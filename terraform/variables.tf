variable "client_id" {}
variable "client_secret" {}
variable "subscription_id" {}
variable "tenant_id" {}

variable "resource_group_name" {
  default = "rg-terraform-state"
}

variable "location" {
  default = "eastus"
}
