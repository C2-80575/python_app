pipeline {
    agent any

    triggers {
        pollSCM('*/1 * * * *')  // Polls the SCM every 1 minute
    }

    stages {
        stage ('SCM') {
            steps {
                git branch: 'main', url: 'https://github.com/C2-80575/python_app.git'
            }
        }
        stage ('docker login') {
            steps {
                sh 'echo dckr_pat__GhsueUGU6mUbUtncfFt1ZUv7c0 | /usr/bin/docker login -u amritesh21 --password-stdin'
            }
        }
        stage ('docker build image') {
            steps {
                sh '/usr/bin/docker image build -t amritesh21/python_app .'
            }
        }
        stage ('docker push image') {
            steps {
                sh '/usr/bin/docker image push amritesh21/python_app'
            }
        }
        stage ('docker remove service') {
            steps {
                sh '/usr/bin/docker service rm myservice'
            }
        }
        stage ('docker create service') {
            steps {
                sh '/usr/bin/docker service create --name myservice -p 4000:4000 --replicas 5 amritesh21/python_app'
            }
        }
    }
}
