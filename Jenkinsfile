pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = credentials('amritesh21')
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build and Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'amritesh21') {
                        def customImage = docker.build('amritesh21/python_app', '.')
                        customImage.push()
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    sh 'docker stack deploy -c docker-compose.yml python_app_stack'
                }
            }
        }
    }
}

