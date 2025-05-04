pipeline {
    agent any

    environment {
        IMAGE_NAME = 'ashwinr2001/may042025projecthotsar'
        IMAGE_TAG = 'v1'
    }

    stages {
        stage('Build Maven') {
            steps {
                git url: 'https://github.com/ashwinr200/Hotstar-App/', branch: 'master'
                sh 'mvn clean install'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Stop any existing container with the same name
                    sh 'docker rm -f hotstar-container || true'
                    // Run with correct port mapping (Jenkins uses 8080, so we expose 2021 instead)
                    sh "docker run -d --name hotstar-container -p 2021:8080 ${IMAGE_NAME}:${IMAGE_TAG}"
                }
            }
        }

        stage('Docker Login & Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-pwd', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                    sh "echo $PASS | docker login -u $USER --password-stdin"
                    sh "docker push ${IMAGE_NAME}:${IMAGE_TAG}"
                }
            }
        }

        stage('Deploy to Kubernetes') {
            when {
                expression { env.GIT_BRANCH == 'master' }
            }
            steps {
                script {
                    kubernetesDeploy(configs: 'deploymentservice.yaml', kubeconfigId: 'k8sconfigpwd')
                }
            }
        }
    }
}
