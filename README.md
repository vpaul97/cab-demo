# cab-demo: provider supply-chain policies

`policies/` holds the custom Terraform policy. `prewritten/` holds an unmodified policy from the
prewritten policy library (`kms-key-rotation-enabled`). `main.tf` is intentionally non-compliant:
- `cloudposse/utils` is not from the `hashicorp` namespace
- `hashicorp/aws ~> 4.67` is below the required `>= 5.0.0`
- `aws_kms_key.logs` does not enable key rotation (prewritten policy, advisory)

Local run (Terraform 1.17 + tfpolicy-plugin in `bin/`, AWS credentials exported):

    export PATH=$PWD/bin:$PATH
    terraform init
    terraform plan --policies=policies --policies=prewritten

Policy tests:

    cd policies && tfpolicy test
