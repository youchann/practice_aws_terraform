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
  ssm_parameter_store_base = "/${local.app_name}/prod"
	app_env_codebuild = "local"
	app_debug_codebuild = "true"
}

provider "aws" {
	region = "ap-northeast-1"
	default_tags {
		tags = {
			application = local.app_name
		}
	}
}
