terraform {
  backend "local" {
    workspace_dir = "./backend/terraform.tfstate"
  }
}
