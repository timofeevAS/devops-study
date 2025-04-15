pipeline {
    agent { label 'timofeev-jenkins' }

    stages {
        stage('Build stage.') {
            steps {
                build(job: 'timofeev-buildjob')
            }
        }
        stage('Infrastacture stage.') {
            steps {
                build(job: 'timofeev-infra-ansible-dev')
            }
        }
        }
        stage('Deploy stage') {    
            steps {
                    build(job: 'timofeev-infra-ansible-dev')
            }
        }
}