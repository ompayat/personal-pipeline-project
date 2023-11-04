pipeline {

    agent any
    
    environment {
        PASS = credentials('PASS') 
    }

    stages {

        stage('Build') {
            steps {
                sh '''
                    ./jenkins/build/mvn.sh mvn -B -DskipTests clean package
                    ./jenkins/build/build.sh

                '''
            }

            post {
                success {
                   archiveArtifacts artifacts: 'java-app/target/*.jar', fingerprint: true
                   sh 'chown 1000:1000 /var/jenkins_home/workspace/pipeline-docker-maven/java-app/target -R'
                }
            }
        }

        stage('Test') {
            steps {
                sh './jenkins/test/mvn.sh mvn test'
            }

            post {
                always {
                    junit 'java-app/target/surefire-reports/*.xml'
                    sh 'chown 1000:1000 /var/jenkins_home/workspace/pipeline-docker-maven/java-app/target -R'
                }
            }
        }

        stage('Push') {
            steps {
                sh './jenkins/push/push.sh'
            }
        }

        stage('Deploy') {
            steps {
                sh './jenkins/deploy/deploy.sh'
            }
        }
    }
}