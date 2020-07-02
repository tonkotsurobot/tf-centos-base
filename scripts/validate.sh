#!/bin/sh

set -xe

echo "Ensure .tf files are clean"
terraform init
for file in *.tfvars
do
    terraform validate -var-file=${file}
done