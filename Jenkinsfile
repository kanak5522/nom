pipeline {
    agent any

    environment {
        AWS_CREDENTIALS_ID = 'knkaws'
        GIT_CREDENTIALS_ID = 'knkgithub'
    }

    stages {
        stage('Checkout') {
            steps {
                git credentialsId: "${knkgithub}", url: 'https://github.com/kanak5522/nom.git'
            }
        }

        stage('Terraform Init') {
            steps {
                withAWS(credentials: "${knkaws}") {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                withAWS(credentials: "${knkaws}") {
                    sh 'terraform plan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                input 'Approve Terraform Apply?'
                withAWS(credentials: "${knkaws}") {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: '**/terraform.tfstate'
            cleanWs()
        }
    }
}
