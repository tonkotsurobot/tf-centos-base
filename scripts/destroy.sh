#!/bin/sh

set -xe

echo "destroy existing resources"

wget http://192.168.1.30:8000/scripts/terraform_vcenter_cred.sh -O /tmp/terraform_vcenter_cred.sh 
chmod u+x /tmp/terraform_vcenter_cred.sh
. /tmp/terraform_vcenter_cred.sh
terraform init
terraform destroy -input=false -var template_name=centos-base -var vm_name=centos-vm -var ip_address=192.168.1.60  -var vsphere_datastore=esx-nfs-1 -auto-approve