pipeline {
    agent any
    stages { 
        stage('fetch code') {
            steps {
                git branch: 'master', url:'https://github.com/akshitelsner/laravel-project.git'
            }
        }
<<<<<<< HEAD
        stage('SonarQube Analysis') {
            def mvn = tool 'Maven';
            withSonarQubeEnv() {
                sh "${mvn}/bin/mvn clean verify sonar:sonar -Dsonar.projectKey=sonar-test"
=======
        stage('sonarqube analysis') {
            steps {
                def mvn = tool 'Maven';
                withSonarQubeEnv(installationName: 'sonar') {
                    sh "${mvn}/bin/mvn clean verify sonar:sonar -Dsonar.projectKey=sonar-test"
                }
>>>>>>> 6d5b0b2117b52ec8faec2cbd8977ac39913211de
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
