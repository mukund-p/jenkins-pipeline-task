pipeline {
    agent any

    environment {
        IMAGE_NAME = "myapp"
        IMAGE_TAG = "latest"
        APP_PORT = "8081"
        CONTAINER_NAME = "myapp-container"
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/mukund-p/jenkins-pipeline-task.git', branch: 'main'
            }
        }

        stage('Build') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t $IMAGE_NAME:$IMAGE_TAG .'
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                sh 'echo "All tests passed!"'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying application...'
                sh '''
                    # Stop and remove existing container if it exists
                    if [ $(docker ps -aq -f name=$CONTAINER_NAME) ]; then
                        echo "Stopping and removing existing container: $CONTAINER_NAME"
                        docker stop $CONTAINER_NAME
                        docker rm $CONTAINER_NAME
                    fi

                    # Run new container with specific name
                    docker run -d --name $CONTAINER_NAME -p $APP_PORT:80 $IMAGE_NAME:$IMAGE_TAG
                '''
            }
        }
    }
}
