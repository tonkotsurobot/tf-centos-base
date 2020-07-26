This is a buildkite pipeline that provisions a VM from a template on vcenter 7.0, using terraform.


PREREQUISITE:
1. vcenter creds are stored in "http://192.168.1.30:8000/scripts/terraform_vcenter_cred.sh". Modify scripts/* as necessary with the location of vcenter creds otherwise

2. This repo assumes the following:
vsphere_datacenter = "DC"
vsphere_cluster = "HOME"
vsphere_datastore = "esx-nfs-1"
Modify terraform.tfvars as necessary otherwise

3. The spec of the VMs (CPU, RAM, NIC, DNS, etc) are specified in vm.tf



Steps:
1. Update build.env
2. PROFIT!!!

