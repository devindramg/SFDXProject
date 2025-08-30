pipeline {
    agent any

    stages {
        stage('Checkout from GitHub') {
            steps {
                git branch: 'master',
                    url: 'https://github.com/your-org/your-repo.git',
                    credentialsId: 'github-creds'
            }
        }

        stage('Authenticate Salesforce Org') {
            steps {
                withCredentials([file(credentialsId: 'sf-jwt-key', variable: 'JWT_KEY_FILE')]) {
                    sh '''
                    sf org login jwt \
                        --client-id 3MVG99AeQQhMVo3SAh7nBX_evEGcaF3nEdNhkHZ35.h2DnvCcEwXZBuqdPoAw1q7hOkUoSSJ08eAwHUOoS.jt \
                        --jwt-key-file $JWT_KEY_FILE \
                        --username ktdocsgendevorg@techkasetti.com \
                        --instance-url https://login.salesforce.com \
                        --alias DevOrg
                    '''
                }
            }
        }

        stage('Deploy to Salesforce') {
            steps {
                sh '''
                sf project deploy start --target-org DevOrg --verbose
                '''
            }
        }
    }
}
