data "terraform_remote_state" "vpc" {
  backend = "remote"

  config = {
    organization = "my-org"
    workspaces = {
      name = "workspace-networking"
    }
  }
}

resource "random_pet" "server" {
  keepers = {
    uuid = data.terraform_remote_state.vpc.outputs.cidr
  }

  length = "${var.pet_name_length}"
  prefix = data.terraform_remote_state.vpc.outputs.vpc_id
}
