pipeline {
    agent any
    
    tools {
        jdk 'Java17'
        maven 'Maven3'
    }

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
    }
}
