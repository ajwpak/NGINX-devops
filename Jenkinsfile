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
                git branch: 'master', credentialsId: 'Jenkins', url: 'git@github.com:ajwpak/NGINX-devops.git'
            }
        }
    
        stage('Terraform') {
            steps {
                script {
                    if (params.Action == "apply") {
                        sh 'terraform init terraform/static-site'
                        sh 'terraform apply -var "group=web" -var --auto-approve terraform/static-site'
                    }
                    else {
                        sh 'terraform destroy -var "group=web" --auto-approve terraform/static-site'
                    }
                }
            }
        }

        stage('Ansible') {
            steps {
                retry(count: 5) {
                    sh 'ansible-playbook -i ~/devops1/ansible/aws_ec2.yml ~/devops1/ansible/playbook.yml'
                }
            }
        }
    }
}