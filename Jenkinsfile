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
		stage('Logging into AWS ECR') {
			steps {
				script {
					sh """aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/e1d1d8b3"""
				}
			}
		}
		stage("build image"){
			steps{
				script{
					sh "docker build -t myregistry1 ."
				}
			}
		}
		stage('Pushing to ECR') {
			steps{ 
				script {
					sh "docker tag myregistry1:latest public.ecr.aws/e1d1d8b3/myregistry1:latest"
					sh "docker push public.ecr.aws/e1d1d8b3/myregistry1:latest"
				}
			}
		}
					
	}
}
