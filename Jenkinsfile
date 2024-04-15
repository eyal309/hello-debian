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
                    sh 'cd build && dpkg-buildpackage -us -uc'
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
