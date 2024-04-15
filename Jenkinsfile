pipeline {
    agent {
        dockerfile {
            filename 'build/Dockerfile'
            reuseNode true
        }
    }
    
    stages {
        stage('Build') {
            steps {
                script {
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
