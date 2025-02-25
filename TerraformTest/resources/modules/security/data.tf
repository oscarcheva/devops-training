data "terraform_remote_state" "remote_state_data_source" {
  backend = "s3"

  config = {
    bucket = "my-tf-bucket-sa-east-1"
    key    = "tfState/terraform.tfstate"
    region = "sa-east-1"
  }
}
