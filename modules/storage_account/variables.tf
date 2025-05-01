variable "storage_account_name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "account_tier" {
  type    = string
  default = "Standard"
}

variable "account_replication_type" {
  type    = string
  default = "LRS"
}

variable "location" {
  type = string
}

variable "containers" {
  type = list(object({
    name        = string
    access_type = string
  }))
}
