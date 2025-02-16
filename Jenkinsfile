pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/alelimc/Comp367Lab2WebApp.git'
            }
        }
        stage('Build') { 
            steps {
                bat 'mvn clean install'
            }
        }
    }
}
