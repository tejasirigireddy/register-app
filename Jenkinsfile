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
		stage("build image"){
			steps{
				script{
					sh "docker build -t myregistry1 ."
				}
			}
		}
		stage("build and push"){
			steps{
				script{
					def buildnumber=env.BUILD_NUMBER
					def repositoryName="teja7781/totalproject"
					withDockerRegistry(credentialsId: 'teja7781'){
						sh "docker build -t ${repositoryName}:${buildNumber} ."
						sh "docker push ${repositoryName}:${buildNumber}"
					}
				}
			}
		}
		stage("update deployment file"){
			environmet{
				GIT_REPO_NAME="register-app"
				GIT_USER_NAME="tejasirigireddy"
			}
			steps{
				withCredentials(credentialsId: 'tejasirigireddy'){
					sh '''
                                            git config user.email "tejaswinisy2000@gmail.com"
                                            git config user.name "tejasirigireddy"
					    BUILD_NUMBER=${BUILD_NUMBER}'''
				}
			}
		}
	                                    
	 
     
						
				
					
	}
}
