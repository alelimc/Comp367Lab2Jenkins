pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'alelimc/maven-webapp'
        DOCKER_CREDENTIALS = 'docker-hub-credentials'  // Ensure this ID matches Jenkins credentials
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/alelimc/Comp367Lab2Jenkins.git'
            }
        }

        stage('Build Maven Project') {
            steps {
                bat 'mvn clean package'
            }
        }

        stage('Verify Credentials') {
            steps {
                script {
                    echo "Checking Docker credentials..."
                }
            }
        }

        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(credentialsId: DOCKER_CREDENTIALS, usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    echo "Docker login using credentials..."
                    bat "echo DOCKER_USER: %DOCKER_USER%"
                    bat 'if "%DOCKER_PASS%"=="" (echo DOCKER_PASS is empty! && exit /b 1)'
                    bat 'docker login -u %DOCKER_USER% -p %DOCKER_PASS% https://index.docker.io/v1/'
                }
            }
        }

        stage('Docker Build') {
            steps {
                bat "docker build -t $DOCKER_IMAGE ."
            }
        }

        stage('Docker Push') {
            steps {
                bat "docker push $DOCKER_IMAGE"
            }
        }
    }
}
