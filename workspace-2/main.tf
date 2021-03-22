data "terraform_remote_state" "output_test" {
  backend = "atlas"
  config = {
    name = "GE-Vault-Deployment-Service/test-workspace"
  }
}

resource "random_pet" "server" {
  keepers = {
    uuid = "${uuid()}"
  }

  length = "${var.pet_name_length}"
  prefix = data.terraform_remote_state.output_test.outputs.server
}
