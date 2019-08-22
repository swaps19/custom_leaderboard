pipeline {
    agent { docker { image 'ruby' } }
    stages {
        stage('build') {
            steps {
                sh 'rails s -b 0.0.0.0'
            }
        }
    }
}