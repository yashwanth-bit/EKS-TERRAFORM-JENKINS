pipeline {
    agent any

    stages {
        stage('Clone Git Repo') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: 'GitHubAccess', url: 'git@github.com:yashwanth-bit/Eks-Terraform-Jenkins.git']]])
            }
        }
         stage('Terraform Plan') {
            steps {
                    sh 'ls -al'
                    sh 'terraform init -backend-config=backend.json'
                    sh 'terraform plan'
            }
        }
        stage('Terraform apply') {
            steps {
                    sh 'ls -al'
                    sh 'terraform init -backend-config=backend.json'
                    sh 'terraform apply --auto-approve'
                    sh 'terraform state list'
            }
        }
    }
}    
