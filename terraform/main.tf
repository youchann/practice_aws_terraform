terraform {
	required_providers {
	  aws = {
      source = "hashicorp/aws"
      version = ">= 4.1.0"
	  }
	}
}

locals {
  app_name = "tfpractice"
	host_domain = "youchannpracticeterraformapp.tk"
	app_domain_name = "app.youchannpracticeterraformapp.tk"
  api_domain_name = "api.youchannpracticeterraformapp.tk"
}

provider "aws" {
	region = "ap-northeast-1"
	default_tags {
		tags = {
			application = local.app_name
		}
	}
}
