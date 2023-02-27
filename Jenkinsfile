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
    }
}