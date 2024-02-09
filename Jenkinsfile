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
					sh "docker build -t my_image ." 
				}
			}
		}
		stage("push image to hub"){
			steps{
				script{
					def dockerImageName='my_image'
					def dockerHubCredentials='teja7781'
					docker.withRegistry('https://index.docker.io/v1/', "${dockerHubCredentials}"){
						docker.image("${dockerImageName}").push("teja7781/repo-1")
					}
				}
			}
		}
		
	}
}
