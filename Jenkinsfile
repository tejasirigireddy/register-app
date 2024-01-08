pipeline {
    agent any
    stages {
        stage("cleanup workspace") {
            steps {
                cleanWs()
            }
        }
        stage("checkoutfrom github"){
            steps{
                git branch: 'main', url: 'https://github.com/tejasirigireddy/register-app.git'
            }
        }
        stage("build application"){
            steps{
                sh 'mvn clean package'
            }
        }
        stage("Test"){
            steps{
                sh 'mvn test'
            }
        }
        stage("sonarcubeanalysis"){
            steps{
                script{
                    withSonarQubeEnv(credentialsId: 'jenkins-sonarqube-token'){
                        sh "mvn sonar:sonar"
                    }
                }
            }
        }
    }
}
