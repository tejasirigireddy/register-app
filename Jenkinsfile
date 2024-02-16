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
		stage("update buildnumber in manifestfile"){
			environment{
				GIT_USER_NAME="tejasirigireddy"
			        GIT_REPO_NAME="register-app"
			}	
			steps{
				withCredentials([string(credentialsId: 'tejasirigireddy'variable: 'GITHUB_TOKEN')]){
					sh '''
                                            git config user.mail="tejaswinisy2000@gmail.com"
					    git config user.name="tejasirigireddy"
	                                    build_number=${BUILD_NUMBER}
				            sed -i "s/replacetag/${build_number}/g" manifestfile/deployment.yml
		                            git add manifestfile/deployment.yml
			                    git commit -m "updating build number in deployment file"
		                            git push https://${GITHUB_TOKEN}@github.com/${GIT_USER_NAME}/${GIT_REPO_NAME} HEAD:main
			                '''
				}
			}
		}
	}
}
