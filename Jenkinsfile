pipeline{
	agent any
	environment {
		APP_NAME = "register-app-pipeline"
                RELEASE = "1.0.0"
                DOCKER_USER = "teja7781"
                DOCKER_PASS = 'teja7781'
                IMAGE_NAME = "${DOCKER_USER}" + "/" + "${APP_NAME}"
                IMAGE_TAG = "${RELEASE}-${BUILD_NUMBER}"
	        JENKINS_API_TOKEN = credentials("JENKINS_API_TOKEN")
	}
	stages{
		stage("clean workspace"){
			steps{
				cleanWs()
			}
		}
		stage("checkout from github"){
			steps{
				git branch:'main', url: 'https://github.com/tejasirigireddy/register-app.git'
			}
		}
		stage("build package"){
			steps{
				sh 'mvn clean package'
			}
		}
		stage("test"){
			steps{
				sh 'mvn test'
			}
		}
		
		stage("Build & Push Docker Image") {
			steps {
				script {
					docker.withRegistry('',teja7781) {
						docker_image = docker.build "${IMAGE_NAME}"
					}
					docker.withRegistry('',teja7781) {
						docker_image.push("${IMAGE_TAG}")
						docker_image.push('latest')
					}
				}
			}
		}
	}
}
