###providers.tf###

# Defining Terraform backend + required providers
terraform {
  backend "s3" {
    bucket                      = "tfe"
    key                         = "terraform.tfstate"
    endpoint                    = ### change to minio container endpoint if using minio
    access_key                  = ### paste minio access key
    secret_key                  = ### paste minio secret key
    region                      = "main"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    force_path_style            = true
  }
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
    }
  }
}


provider "libvirt" {
  ## Configuration options
  uri = "qemu:///system"
  #alias = "server2"
  #uri   = "qemu+ssh://"
  #uri   = "qemu+tcp://"
}
