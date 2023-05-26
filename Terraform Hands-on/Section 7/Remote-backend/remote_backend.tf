/* This code comes directly when you give cli based when you create workspace in terraform cloud.
Using this is for doing the local run and the respective workspace will be updated */

terraform {
  cloud {
    organization = "abdulhafis-org"

    workspaces {
      name = "remote-operation"
    }
  }
}