pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/alelimc/Comp367Lab2Jenkins.git'
            }
        }
        stage('Build') { 
            steps {
                bat 'mvn clean install'
            }
        }
    }
}
