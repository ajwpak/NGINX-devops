pipeline {
    agent any
    parameters {
        choice(
            name: 'Action',
            choices: "apply\ndestroy",
            description: 'Apply or Destroy Instance'
        )
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', credentialsId: 'jenkins-github', url: 'git@github.com:ajwpak/NGINX-devops.git'
            }
        }
    
        stage('Terraform') {
            steps {
                script {
                    if (params.Action == "apply") {
                        sh 'terraform -chdir=/var/lib/jenkins/workspace/nginx-pipeline/terraform init'
                        sh 'terraform -chdir=/var/lib/jenkins/workspace/nginx-pipeline/terraform apply -auto-approve'
                    }
                    else {

                        sh 'terraform -chdir=/var/lib/jenkins/workspace/nginx-pipeline/terraform destroy -auto-approve'
                    }
                }
            }
        }

        stage('Ansible') {
            steps {
                sleep 60
                sh 'ansible-playbook -i /etc/ansible/aws_ec2.yml ansible/playbook.yml'
                
            }
        }
    }
}