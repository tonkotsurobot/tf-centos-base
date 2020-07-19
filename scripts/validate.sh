#!/bin/sh

set -xe

echo "Ensure .tf files are clean"
terraform init -backend-config=backend_config.hcl
terraform validate
rm -rf .terraform