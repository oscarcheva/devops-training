terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "6.2.2"
    }
  }
}
provider "aws" {
  region  = var.aws_region
  profile = "default"

}

provider "github" {
  token = "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"
}

resource "aws_s3_bucket" "s3-bucket-2" {
  bucket = "my-second-bucket"
}




