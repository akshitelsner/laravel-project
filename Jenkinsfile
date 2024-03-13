pipeline {
    agent any
    stages { 
        stage('fetch code') {
            steps {
                git branch: 'master', url:'https://github.com/akshitelsner/laravel-project.git'
            }
        }
        stage('SonarQube Analysis') {
            def mvn = tool 'Maven';
            withSonarQubeEnv() {
                sh "${mvn}/bin/mvn clean verify sonar:sonar -Dsonar.projectKey=sonar-test"
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
