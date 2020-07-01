#!/bin/sh

set -xe

echo "Ensure .tf files are clean"
for file in *.tfvars
do
    terraform validate -var-file=${file}
done