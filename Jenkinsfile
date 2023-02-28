pipeline {
    agent any

    environment{
        CLOUDSDK_CORE_PROJECT = 'o-media-2'
    }

    stages{


        stage('gcp_authentication'){
            steps{
                sh 'gcloud auth activate-service-account --key-file $GOOGLE_APPLICATION_CREDENTIALS'
            }
        }
        stage('Terraform Init') {
            steps {
              sh 'terraform init'
            }
        }
        stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
                // sh 'terraform plan -var app_name=${TF_VAR_app_name} -var env=${TF_VAR_env} -out=tfplan'
            }
        }
    }
}