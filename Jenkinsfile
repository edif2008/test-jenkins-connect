pipeline {
    agent {
        dockerfile true
    }

    stages {
        stage('OP CLI test') {
            environment {
                OP_CONNECT_HOST='http://localhost:8000'
                OP_CONNECT_TOKEN=credentials('op_connect_token')
            }
            steps {            
                // Read a secret
                sh './op read op://acceptance-tests/test-secret/username'
            }
        }
    }
}
