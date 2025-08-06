pipeline {
    agent any

    environment {
        IMAGE_NAME = "devops_task2_app"
        CONTAINER_NAME = "devops_task2_container"
        PORT = "5000"
    }

    stages {
        stage('Clone Repo') {
            steps {
                echo '🔁 Cloning repository...'
                sh 'rm -rf devops_Task2'
                sh 'git clone https://github.com/sanjay720813/devops_Task2.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                dir('devops_Task2') {
                    echo '📦 Installing Node.js packages...'
                    sh 'npm install'
                }
            }
        }

        stage('Run Tests') {
            steps {
                dir('devops_Task2') {
                    echo '✅ Running tests (mock)...'
                    sh 'echo "Tests passed!"'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                dir('devops_Task2') {
                    echo "🐳 Building Docker image: ${IMAGE_NAME}"
                    sh "docker build -t ${IMAGE_NAME} ."
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                echo "🚀 Running container on port ${PORT}..."
                sh """
                    docker stop ${CONTAINER_NAME} || true
                    docker rm ${CONTAINER_NAME} || true
                    docker run -d -p ${PORT}:${PORT} --name ${CONTAINER_NAME} ${IMAGE_NAME}
                """
            }
        }
    }

    post {
        success {
            echo "🎉 Build and deployment successful on port ${PORT}!"
        }
        failure {
            echo "❌ Build failed. Check logs."
        }
    }
}

