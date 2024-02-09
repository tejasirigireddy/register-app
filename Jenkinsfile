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
					docker.build('myimageone')
				}
			}
		}
		stage("push to dockerhub"){
			steps{
				script{
					docker.withRegistry('https://hub.docker.com/repository/docker/teja7781/totalproject', 'teja7781')
					docker.image('myimageone').push('latest')
				}
			}
		}
		
		}
	}
			
