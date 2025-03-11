pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'alelimc/maven-webapp'
        DOCKER_CREDENTIALS = 'docker-hub-credentials'  // Make sure this ID matches Jenkins credentials
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/alelimc/Comp367Lab2Jenkins.git'
            }
        }

        stage('Build Maven Project') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Verify Credentials') {
            steps {
                script {
                    echo "Checking Docker credentials..."
                    sh 'echo "DOCKER_USER: $DOCKER_USER"'
                    sh 'if [ -z "$DOCKER_PASS" ]; then echo "DOCKER_PASS is empty!"; exit 1; fi'
                }
            }
        }

        stage('Docker Login') {
            steps {
                withDockerRegistry([credentialsId: DOCKER_CREDENTIALS, url: 'https://index.docker.io/v1/']) {
                    echo 'Docker login successful!'
                }
            }
        }

        stage('Docker Build') {
            steps {
                sh "docker build -t $DOCKER_IMAGE ."
            }
        }

        stage('Docker Push') {
            steps {
                sh "docker push $DOCKER_IMAGE"
            }
        }
    }
}
