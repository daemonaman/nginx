pipeline {
    agent any

    environment {
        IMAGE_NAME = 'my-nginx-app'
        DOCKER_REGISTRY = 'https://hub.docker.com/repository/docker/daemonaman/' // Example: 'docker.io/yourusername'
        IMAGE_TAG = 'latest'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/daemonaman/nginx.git' // Replace with your repository URL
            }
        }

        stage('Build') {
            steps {
                script {
                    sh 'sudo docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .'
                }
            }
        }

        stage('Push') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker_hub_id1') {
                        docker.image("${IMAGE_NAME}:${IMAGE_TAG}").push()
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    sh '''
                    docker run -d -p 8080:80 ${DOCKER_REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}
                    '''
                }
            }
        }
    }

    post {
        always {
            echo 'Cleaning up...'
            cleanWs()
        }
    }
}
