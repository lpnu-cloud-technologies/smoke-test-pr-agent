terraform {
  required_version = ">= 1.5"
  required_providers {
    aws = { source = "hashicorp/aws", version = "~> 5.0" }
  }
  backend "s3" {
    bucket         = "my-tfstate-bucket"
    key            = "cloud-course/terraform.tfstate"
    region         = "eu-central-1"
    use_lockfile   = true
  }
}

provider "aws" {
  region = var.region
}

module "courses_table" {
  source      = "./modules/dynamodb"
  context     = module.label.context
  table_name  = "courses"
}

module "authors_table" {
  source      = "./modules/dynamodb"
  context     = module.label.context
  table_name  = "authors"
}
