terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "jerome-playground"
    workspaces {
      name = "terraform-azure-hashicat"
    }
  }
}
