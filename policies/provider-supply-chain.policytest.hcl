policytest {
  targets = ["provider-supply-chain.policy.hcl"]
}

provider "aws" "approved" {
  meta = {
    source  = "registry.terraform.io/hashicorp/aws"
    version = "5.100.0"
  }
}

provider "aws" "old_version" {
  expect_failure = true
  meta = {
    source  = "registry.terraform.io/hashicorp/aws"
    version = "4.67.0"
  }
}

provider "aws" "unofficial_source" {
  expect_failure = true
  meta = {
    source  = "registry.terraform.io/acme-corp/aws"
    version = "5.100.0"
  }
}

provider "utils" "community_source" {
  expect_failure = true
  meta = {
    source  = "registry.terraform.io/cloudposse/utils"
    version = "1.4.0"
  }
}
