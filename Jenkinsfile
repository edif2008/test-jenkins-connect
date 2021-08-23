pipeline {
    agent {
        docker { image 'tmaier/docker-compose:20.10' }
    }

    stages {
    	stage('deploy connect') {
    	    steps {
    	    	sh 'systemctl start docker'
    	        sh 'cd connect && docker-compose build'
    	        sh 'cd connect && docker-compose up -d'
    	    }
    	}
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
    post {
      	always {
            sh "cd connect && docker-compose down || true"
        }
    } 
}
