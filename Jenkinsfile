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
		stage("build and push"){
			steps{
				script{
					withDockerRegistry(credentialsId: 'teja7781'){
						sh "docker build -t teja7781/totalproject:tag1"
						sh "docker push teja7781/totalproject:tag2"
	}
}
