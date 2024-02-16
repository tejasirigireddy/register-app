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
		stage("build & push"){
			steps{
				script{
					def buildNumber=env.BUILD_NUMBER
					def repositoryName="teja7781/totalproject"
					withDockerRegistry(credentialsId: 'teja7781'){
						sh "docker build -t ${repositoryName}:${buildNumber} ."
						sh "docker push ${repositoryName}:${buildNumber}"
					}
				}
			}
		}
		stage("update in manifestfile"){	
			steps{
				script{
					def buildnumber=env.BUILD_NUMBER
					sh "sed -i 's/replacetag/${buildnumber}/g' manifestfile/deployment.yml"
					sh "git commit -m 'updated with ${buildnumber}'"
				}
			}
		}
	}
}
