pipeline {
    agent {
        dockerfile {
            filename 'Dockerfile'
            reuseNode true
        }
    }
    
    stages {
        stage('Build') {
            steps {
                script {
                    sh 'cd /home/jenkins/build'
                    sh 'dpkg-buildpackage -us -uc'
                    sh 'cp ../hello-*.* .'
                }
            }
        }
        stage('Publish') {
            steps {
                archiveArtifacts artifacts: 'hello-*.*', onlyIfSuccessful: true, fingerprint: true
            }
        }
    }

    post {
        always {
            cleanWs()
            }
        }
}
