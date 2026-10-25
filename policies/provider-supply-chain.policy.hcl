policy {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.0.0, < 7.0.0"
    }
  }
}

provider_policy "*" "approved_source" {
  enforce {
    condition     = core::startswith(meta.source, "registry.terraform.io/hashicorp/")
    error_message = "Providers must come from the hashicorp namespace. Found: ${meta.source}"
  }
}

provider_policy "aws" "version_check" {
  enforce {
    condition     = core::semverconstraint(meta.version, ">= 5.0.0")
    error_message = "AWS provider must be >= 5.0.0. Found: ${meta.version}"
  }
}
