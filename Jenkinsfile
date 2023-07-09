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
        stage('tests-on-dev') {
            steps {
                run_api_tests("dev")
            }
        }  
        stage('deploy-to-stg') {
            steps {
                deploy("stg")
            }
        }
        stage('tests-on-stg') {
            steps {
                run_api_tests("stg")
            }
        }
        stage('deploy-to-prod') {
            steps {
                deploy("prod")
            }
        }
        stage('tests-on-prod') {
            steps {
                run_api_tests("prod")
            }
        }

    
    }

}
def build_docker_image() {
    echo "Building docker image for python-greetings"

    git branch: 'main', url: 'https://github.com/Leomidant/python-greetings'
    
    sh 'docker build -t razmadzeb/python-greetings-app:latest .'
    sh 'docker push razmadzeb/python-greetings-app:latest'

    // echo "Building docker image for api-tests"

    // git branch: 'main', url: 'https://github.com/Leomidant/course-js-api-framework'
    
    // sh 'docker build -t razmadzeb/api-tests:latest .'
    // sh 'docker push razmadzeb/api-tests:latest'
}

def deploy(String environment){
    echo "Deployment triggered on ${environment} environment.."

    sh "docker pull razmadzeb/python-greetings-app:latest"

    sh "docker-compose stop greetings-app-${environment}"
    sh "docker-compose rm greetings-app-${environment}"
    sh "docker-compose up -d greetings-app-${environment}"
}

def run_api_tests(String environment){
    echo "API tests triggered on ${environment} environment.."
    sh "docker pull razmadzeb/api-tests:latest"
    sh "docker run --network=host razmadzeb/api-tests run greetings greetings_${environment}"
}