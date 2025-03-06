terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "6.2.2"
    }
  }
  backend "s3" {
    bucket = "my-tf-bucket-sa-east-1"
    key    = "tfState/terraform.tfstate"
    region = "sa-east-1"
  }
/*  cloud {

    organization = "testHCPOscar"

    workspaces {
      name = "CLIDrivenWorkspace"
    }
  }*/
}


provider "aws" {
  region = var.aws_region
}

module ec2 {
  source     = "./resources/modules/ec2"
  ami_id     = var.ami_id
  iam_role   = var.iam_role
  security_group_id = [module.security_group.security_group_id]
  subnet_id  = module.network.subnet_id
  aws_region = var.aws_region
}
module security_group {
  source      = "./resources/modules/security"
  main_vpc_id = module.network.vpc_id
}

module network {
  source     = "./resources/modules/network"
  aws_region = var.aws_region
}

output "eip_lb" {
  value = module.network.eip_lb_value
}

module s3_buckets {
  source         = "./resources/modules/buckets"
  s3_bucket_name = "${var.s3_bucket_name}-${var.aws_region}"
}

provider "github" {
  token = "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"
}


