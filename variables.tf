variable "client_id" {}
variable "client_secret" {}
variable "subscription_id" {}
variable "tenant_id" {}

variable "resource_group_name" {
  default = "terraform-state-rg"
}

variable "location" {
  default = "eastus"
}
