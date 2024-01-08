pipeline {
    agent any
    environment{
        APP_NAME="register-app-pipeline"
        RELEASE="2.0.0"
        DOCKER_USER="teja7781"
        DOCKER_PASS="dockerhubcred"
        IMAGE_NAME = "${DOCKER_USER}" + "/" + "${APP_NAME}"
        IMAGE_TAG="${RELEASE}-${BUILD_NUMBER}"
    }
        
    stages {
        stage("cleanup workspace") {
            steps {
                cleanWs()
            }
        }
        stage("checkoutfrom github"){
            steps{
                git branch: 'main', url: 'https://github.com/tejasirigireddy/register-app.git'
            }
        }
        stage("build application"){
            steps{
                sh 'mvn clean package'
            }
        }
        stage("Test"){
            steps{
                sh 'mvn test'
            }
        }
        stage("build and push docker image"){
            steps{
                script{
                    docker.withRegistry('',DOCKER_PASS){
                        def dockerImage=docker.build "${IMAGE_NAME}"
                        dockerImage.push("${IMAGE_TAG}")
                        dockerImage.push('latest')
                    }
                }
            }
        }
        stage("Trivy Scan") {
           steps {
               script {
	            sh ('docker run -v /var/run/docker.sock:/var/run/docker.sock aquasec/trivy image teja7781/register-app-pipeline:latest --no-progress --scanners vuln  --exit-code 0 --severity HIGH,CRITICAL --format table')
               }
           }
        }
	    
        
                    
    }
}
