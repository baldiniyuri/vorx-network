terraform {
  backend "s3" {
    bucket = "baldini-vorx-terraform"
    key    = "vorx-network.tfstate"
    region = "us-east-1"
  }
}
