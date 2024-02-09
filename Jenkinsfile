pipeline{
	agent any
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
