#!/bin/sh

set -xe

echo "destroy existing resources"

wget http://192.168.1.30:8000/scripts/terraform_vcenter_cred.sh -O /tmp/terraform_vcenter_cred.sh 
chmod u+x /tmp/terraform_vcenter_cred.sh
. /tmp/terraform_vcenter_cred.sh
terraform init
terraform destroy -auto-approve
rm -rf .terraform