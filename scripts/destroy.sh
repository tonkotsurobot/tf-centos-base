#!/bin/sh

set -xe

echo "destroy existing resources"

wget http://192.168.1.30:8000/scripts/terraform_vcenter_cred.sh -O /tmp/terraform_vcenter_cred.sh 
chmod u+x /tmp/terraform_vcenter_cred.sh
. /tmp/terraform_vcenter_cred.sh
terraform init -backend-config=backend_config.hcl
terraform destroy -input=false -var template_name=$TEMPLATE_NAME -var vm_name=$VM_NAME -var ip_address=$IP_ADDRESS  -var vsphere_datastore=esx-nfs-1 -auto-approve
rm -rf .terraform