pipeline {
    agent any
    stages { 
        stage('fetch code') {
            steps {
                git branch: 'master', url:'https://github.com/akshitelsner/laravel-project.git'
            }
        }
        stage('sonarqube analysis') {
            steps {
                def mvn = tool 'Maven';
                withSonarQubeEnv(installationName: 'sonar') {
                    sh "${mvn}/bin/mvn clean verify sonar:sonar -Dsonar.projectKey=sonar-test"
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
