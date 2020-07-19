Provision centos based docker VM from centos-docker template on vcenter 7.0

#Set variables on your build machine
export TF_VAR_vsphere_vcenter=CHANGEME
export TF_VAR_vsphere_user=CHANGEME
export TF_VAR_vsphere_password=CHANGEME


#download necessary terraform modules
terraform init


#Deploy machine
terraform plan -out=tfplan -input=false -var template_name=centos-base -var vm_name=test -var ip_address=192.168.1.60 -var vsphere_datastore=esx-nfs-1

terraform apply "tfplan"

OR 

terraform apply -input=false -var template_name=centos-base -var vm_name=test -var ip_address=192.168.1.60 -var vsphere_datastore=esx-nfs-1 -auto-approve


#Destroy machine
terraform destroy -input=false -var template_name=centos-base -var vm_name=test -var ip_address=192.168.1.60 -var vsphere_datastore=esx-nfs-1 -auto-approve

