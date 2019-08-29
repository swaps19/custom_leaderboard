pipeline {
    agent { label 'remote_slave' }
    stages {
        stage('Build') {
            steps {
                sh 'bundle install'
                sh 'bundle exec rails db:migrate'
            }
        }

        stage('Test') {
            steps {
                sh 'bundle exec rails test'
            }
        }

        stage('Deploy') {
            steps {
                sh 'cd /home/remote_user/custom_leaderboard'
                echo '***** Printing the env *****'
                sh 'printenv'
            }
        }
    }
    post {
        always {
            echo 'This will always run'
        }
        success {
            echo 'This will run only if successful'
        }
        failure {
            echo 'This will run only if failed'
        }
        unstable {
            echo 'This will run only if the run was marked as unstable'
        }
        changed {
            echo 'This will run only if the state of the Pipeline has changed'
            echo 'For example, if the Pipeline was previously failing but is now successful'
        }
    }
}