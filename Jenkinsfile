pipeline {
    agent any
    stages {
        stage('build-docker-image') {
            steps {
                build_docker_image()
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