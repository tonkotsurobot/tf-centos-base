node {
 	// Clean workspace before doing anything
    deleteDir()

    try {
        stage ('Clone') {
        	checkout scm
        }
        stage ('Build') {
        	sh "echo 'shell scripts to build project...'"
        }
        stage ('Tests') {
	        parallel 'static': {
	            sh "echo 'shell scripts to run static tests...'"
	        },
	        'unit': {
	            sh "echo 'shell scripts to run unit tests...'"
	        },
	        'integration': {
	            sh "echo 'shell scripts to run integration tests...'"
	        }
        }
      	stage ('Deploy') {
            sh "cd terraform-vmware-builder && terraform init -input=false && terraform plan -out=tfplan -input=false -var template_name=centos-base -var vm_name=test -var ip_address=192.168.1.21 -var vsphere_password=${VCENTER_PASS} -var vsphere_datastore=${DATASTORE} && terraform apply tfplan "
      	}
    } catch (err) {
        currentBuild.result = 'FAILED'
        throw err
    }
}
