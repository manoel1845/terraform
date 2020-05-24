terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "ItauUnibanco"

    workspaces {
      name = "terraform"
    }
  }
}