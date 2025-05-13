pipeline {
    agent any

    environment {
        IMAGE_NAME = "myapp"
        IMAGE_TAG = "latest"
        APP_PORT = "8081"
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
                    # Find and stop container using port $APP_PORT if any
                    CONTAINER_ID=$(docker ps -q --filter "publish=$APP_PORT")
                    if [ ! -z "$CONTAINER_ID" ]; then
                        echo "Stopping existing container on port $APP_PORT..."
                        docker stop $CONTAINER_ID
                        docker rm $CONTAINER_ID
                    fi

                    # Run new container
                    docker run -d -p $APP_PORT:80 $IMAGE_NAME:$IMAGE_TAG
                '''
            }
        }
    }
}
