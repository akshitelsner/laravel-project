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
                withSonarQubeEnv(installationName: 'sonar') {
                    sh './mvnw clean org.sonarsource.scanner.maven:sonar-maven-plugin:3.9.0.2155:sonar'
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
