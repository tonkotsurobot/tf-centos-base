#!/bin/sh

set -xeu

echo "see what's on /workdir"
ls -la

echo "see what's on /mnt/tf-centos-base"
ls -la
#echo "+++ :terraform: Terraform Init"
#terraform init -backend=false
#
#echo "+++ :terraform: Terraform Validate"
#for file in vars/*.tfvars
#do
#    terraform validate -var-file=${file}
#done