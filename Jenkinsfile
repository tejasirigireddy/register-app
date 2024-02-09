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
		stage("build docker image"){
			steps{
				script{
					sh "docker build -t myimageone:${BUILD_NUMBER} ." 
					echo 'image name is${myimageone}'
				}
			}
		}
		stage("push to dockerhub"){
			steps{
				script{
					def dockerImage="myimageone:${BUILD_NUMBER}"
					def dockerHub='teja7781'
					def dockerRepo='totalproject'
					docker.withRegistry("https://index.docker.io/v1/", teja7781){
						docker.image(dockerImage).push("${dockerRepo}:${BUILD_NUMBER}")
						docker.image(dockerImage).push("${dockerRepo}:latest")
					}
				}
			}
		}
		
		}
	
	}
