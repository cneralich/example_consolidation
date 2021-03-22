resource "random_pet" "server" {
  /*keepers = {
    uuid = "${uuid()}"
  }*/

  length = var.pet_name_length
  prefix = var.prefix
}

# variables.tf

variable "pet_name_length" {
  type    = string
  default = "2"
}

variable "prefix" {
  default = "test"
}
