pipeline {
    agent { label '2025-kondraev' }

    stages {
        stage('Prepare TaskBot for Deploy') {
            parallel {
                stage('Build TaskBot') {
                    steps {
                        build(job: 'kondraev-taskbot-build')
                    }
                }
                stage('Prepare infrastructure for TaskBot') {
                    steps {
                        build(job: 'kondraev-infra-ansible-dev')
                    }
                }
            }
        }
        stage('Deploy TaskBot') {    
            steps {
                build(job: 'kondraev-taskbot-deploy', parameters: [string(name: 'SERVER_ADDRESS', value: env.DEV_SERVER_IP)])
            }
        }
    }
}