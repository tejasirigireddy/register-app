pipeline{
	agent any
	environment{
		AWS_ACCOUNT_ID="916755039608"
		AWS_DEFAULT_REGION="us-east-1"
		IMAGE_REPO_NAME="myregistry1"
		IMAGE_TAG="latest"
		REPOSITORY_URL="public.ecr.aws/e1d1d8b3/myregistry1"
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
		stage("build image"){
			steps{
				script{
					def timestamp=new Date().format("yyyyMMddHHmmss")
					sh "docker build -t $IMAGE_REPO_NAME:${timestamp} ."
				}
			}
		}
		stage(" push image to ecr"){
			steps{
				script{
					sh """docker tag ${IMAGE_REPO_NAME}:${timestamp} ${REPOSITORY_URI}:$timestamp"""
					sh """docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}:${timestamp}"""
         }
					
	}
}
