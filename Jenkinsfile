pipeline {
    agent {
        dockerfile true
    }

    stages {
        stage('OP CLI test') {
            environment {
                OP_CONNECT_HOST='https://edf8-2001-1c00-b0b-dd00-3c41-1978-f314-b4f4.ngrok.io'
                OP_CONNECT_TOKEN=credentials('op_connect_token')
            }
            steps {            
                // Read a secret
                sh './op read op://acceptance-tests/test-secret/username'
            }
        }
    }
}
