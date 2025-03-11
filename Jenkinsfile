pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'alelimacapagal/maven-webapp'
        DOCKER_CREDENTIALS = 'docker-hub-credentials' // Jenkins credential ID
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Build Maven Project') {
            steps {
                script {
                    // Run Maven build
                    sh 'mvn clean install'
                }
            }
        }

        stage('Login to Docker Hub') {
            steps {
                script {
                    docker.withCredentials([usernamePassword(credentialsId: DOCKER_CREDENTIALS, usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh "echo $DOCKER_PASSWORD | docker login --username $DOCKER_USER --password-stdin"
                    }
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Docker build command
                    sh 'docker build -t ${DOCKER_IMAGE} .'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Docker push command
                    sh 'docker push ${DOCKER_IMAGE}'
                }
            }
        }
    }
}
