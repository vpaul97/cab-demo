terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

locals {
  common_tags = {
    team = "platform"
    env  = "prod"
  }
}

resource "aws_kms_key" "logs" {
  description             = "Encryption key for application logs"
  deletion_window_in_days = 7
  enable_key_rotation     = true
  tags                    = local.common_tags
}

resource "aws_s3_bucket" "app_logs" {
  bucket = "cab-demo-app-logs"
  tags   = local.common_tags
}