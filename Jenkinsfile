pipeline {
    agent any
    stages {
        stage('build-docker-image') {
            steps {
                build_docker_image()
            }
        }
        stage('deploy-to-dev') {
            steps {
                deploy("dev")
            }
        }
        stage('deploy-to-stg') {
            steps {
                deploy("stg")
            }
        }
        stage('deploy-to-prod') {
            steps {
                deploy("prod")
            }
        }

    
    }

}
def build_docker_image() {
    echo "Building docker image.."

    git branch: 'main', url: 'https://github.com/Leomidant/python-greetings'
    
    sh 'docker build -t razmadzeb/python-greetings-app:latest .'
    sh 'docker push razmadzeb/python-greetings-app:latest'
}

def deploy(String environment){
    echo "Deployment triggered on ${environment} environment.."

    sh "docker pull razmadzeb/python-greetings-app:latest"

    sh "docker-compose stop greetings-app-${environment}"
    sh "docker-compose rm greetings-app-${environment}"
    sh "docker-compose up -d greetings-app-${environment}"
}