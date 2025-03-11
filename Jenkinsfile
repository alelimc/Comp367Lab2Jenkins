pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'alelimacapagal/maven-webapp'
        DOCKER_CREDENTIALS = 'docker-hub-credentials'
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    try {
                        git branch: 'main', 
                            credentialsId: 'github-credentials', 
                            url: 'https://github.com/alelimc/Comp367Lab2Jenkins.git'
                    } catch (Exception e) {
                        echo 'Git checkout failed, trying an alternative method...'
                        checkout scm
                    }
                }
            }
        }

        stage('Build Maven Project') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'mvn clean package'
                    } else {
                        bat 'mvn clean package'
                    }
                }
            }
        }

        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(credentialsId: DOCKER_CREDENTIALS, usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    script {
                        if (isUnix()) {
                            sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                        } else {
                            bat "echo %DOCKER_PASS% | docker login -u %DOCKER_USER% --password-stdin"
                        }
                    }
                }
            }
        }

        stage('Docker Build') {
            steps {
                script {
                    if (isUnix()) {
                        sh "docker build -t $DOCKER_IMAGE ."
                    } else {
                        bat "docker build -t %DOCKER_IMAGE% ."
                    }
                }
            }
        }

        stage('Docker Push') {
            steps {
                script {
                    if (isUnix()) {
                        sh "docker push $DOCKER_IMAGE"
                    } else {
                        bat "docker push %DOCKER_IMAGE%"
                    }
                }
            }
        }
    }
}
