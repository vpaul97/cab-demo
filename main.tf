terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.67"
    }
    utils = {
      source  = "cloudposse/utils"
      version = "~> 1.4"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

data "utils_deep_merge_yaml" "tags" {
  input = [
    "team: platform",
    "env: prod",
  ]
}

resource "aws_s3_bucket" "app_logs" {
  bucket = "cab-demo-app-logs"
  tags   = yamldecode(data.utils_deep_merge_yaml.tags.output)
}
