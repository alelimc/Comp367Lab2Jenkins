pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/alelimc/Comp367Lab2Jenkins.git'
            }
        }
        stage('Build') {
            steps {
                echo 'Building the application...'
            }
        }
    }
}