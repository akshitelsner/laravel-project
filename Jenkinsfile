pipeline {
    agent any
    environment {
        scannerHome = tool 'sonar'
    }
    stages { 
        stage('fetch code') {
            steps {
                git branch: 'master', url: 'https://github.com/akshitelsner/laravel-project.git'
            }
        }
        stage('sonarqube analysis') {
            steps {
                withSonarQubeEnv('sonar') {
                    sh "${scannerHome}/bin/sonar-scanner"
                }
            }
        }
        stage('Quality Gate') {
            steps {
                timeout(time: 3, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }            
    }
}
