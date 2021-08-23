pipeline {
    agent {
        docker { image 'docker/compose:alpine-1.29.2' }
    }

    stages {
    	stage('deploy connect') {
    	    steps {
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
            sh "docker-compose down || true"
        }
    } 
}
