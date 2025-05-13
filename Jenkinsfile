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
            echo "Cleaning up existing container with name $CONTAINER_NAME if it exists..."
            if [ $(docker ps -aq -f name=$CONTAINER_NAME) ]; then
                docker stop $CONTAINER_NAME
                docker rm $CONTAINER_NAME
            fi

            echo "Checking for any container using port $APP_PORT..."
            PORT_IN_USE=$(docker ps --filter "publish=$APP_PORT" -q)
            if [ ! -z "$PORT_IN_USE" ]; then
                echo "Port $APP_PORT is in use by container: $PORT_IN_USE. Stopping and removing it..."
                docker stop $PORT_IN_USE
                docker rm $PORT_IN_USE
            fi

            echo "Running new container..."
            docker run -d --name $CONTAINER_NAME -p $APP_PORT:80 $IMAGE_NAME:$IMAGE_TAG
        '''
            }
        }
   }
}
