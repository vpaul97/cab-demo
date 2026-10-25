# cab-demo: provider supply-chain policy

`policies/` holds the custom Terraform policy.

Local run (Terraform 1.17 + tfpolicy-plugin in `bin/`, AWS credentials exported):

    export PATH=$PWD/bin:$PATH
    terraform init
    terraform plan --policies=policies

Policy tests:

    cd policies && tfpolicy test
