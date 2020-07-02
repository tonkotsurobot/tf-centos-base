#!/bin/sh

set -xe

echo "Ensure .tf files are clean"
terraform init
terraform validate