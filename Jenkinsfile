pipeline {
    agent { label 'timofeev-jenkins' }

    stages {
        stage('Prepare infra and build (DEV)') {
            parallel {
                stage('Build stage (DEV)') {
                    steps {
                        build(job: 'timofeev-buildjob')
                    }
                }
                stage('Infrastructure stage (DEV)') {
                    steps {
                        build(job: 'timofeev-infra-ansible-dev')
                    }
                }
            }
        }
        
        stage('Deploy (DEV)') {    
            steps {
                build(job: 'timofeev-deployjob')
            }
        }
        stage('Promote to PROD') {
            stages {
                stage('Prepare PROD infra and build') {
                    parallel {
                        stage('Build stage (PROD)') {
                            steps {
                                build(job: 'timofeev-buildjob-yandex')
                            }
                        }
                        stage('Infrastructure stage (PROD)') {
                            steps {
                                build(job: 'timofeev-infra-ansible-yandex')
                            }
                        }
                    }
                }
                
                stage('Deploy (PROD)') {
                    steps {
                        build(job: 'timofeev-deployjob-yandex')
                    }
                }
            }
        }
    }
    
    post {
        success {
            echo 'Все стадии успешно завершены!'
        }
        failure {
            echo 'Pipeline завершился с ошибкой'
        }
    }
}