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
  tags = {
    team = "platform"
    env  = "prod"
  }
}

resource "aws_kms_key" "logs" {
  description             = "Encryption key for application logs"
  deletion_window_in_days = 7
}

resource "aws_s3_bucket" "app_logs" {
  bucket = "cab-demo-app-logs"
  tags   = local.tags
}